Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C2410E7C0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jan 2023 14:19:03 +0000 (UTC)
Date: Wed, 25 Jan 2023 15:18:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230125141859.btrbroaix7gxogkv@kamilkon-desk1>
References: <20230117140607.2759816-1-mauro.chehab@linux.intel.com>
 <20230117140607.2759816-7-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117140607.2759816-7-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 06/12] code_cov_parse_info: add support
 for parsing JSON files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-01-17 at 15:06:01 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Currently, the tool supports only info files, provided by
> lcov tool. While this works, the info output lacks support to
> properly identify what function is related to branches and
> lines. Such limitation doesn't exist with json. So, add
----------------------------------------------- ^^^
s/. So,/ so /

> support for parsing it.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/code_cov_parse_info | 441 ++++++++++++++++++++++++++++++------
>  1 file changed, 366 insertions(+), 75 deletions(-)
>  mode change 100755 => 100644 scripts/code_cov_parse_info
> 
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> old mode 100755
> new mode 100644
> index 3982dbd513c4..80a9f1c25540
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -28,6 +28,16 @@ my $verbose = 0;
>  my $ignore_unused = 0;
>  my $skip_func = 0;
>  
> +my $has_json_support = eval {
> +	require Cpanel::JSON::XS;
> +	Cpanel::JSON::XS->import(qw(decode_json));
> +	1;
> +};
> +
> +if (!$has_json_support) {
> +	print "Warning: System doesn't have Cpanel::JSON::XS. Can't use gcov directly.\n";
> +}
> +
>  sub is_function_excluded($)
>  {
>  	return 0 if (!@func_include_regexes && !@func_exclude_regexes);
> @@ -76,7 +86,285 @@ sub is_file_excluded($)
>  # Use something that comes before any real function
>  my $before_sf = "!!!!";
>  
> -sub parse_info_data($)
> +sub parse_json_gcov_v1($$)
> +{
> +	my $file = shift;
> +	my $json = shift;
> +
> +	my $was_used = 0;
> +	my $has_func = 0;
> +	my $ignore = 0;
> +
> +	my $cur_test = $file;
> +	$cur_test =~ s#^.*/##;
> +	$cur_test =~ s#\.json$##;
> +	$test_names{$cur_test} = 1;
> +
> +	# Store the common JSON data into the record
> +	for my $key (keys %$json) {
> +		next if ($key eq "files");
> +		next if ($key eq "functions");
> +		next if ($key eq "lines");
> +		# Store any extra data
> +		$record{$key} = $json->{$key};
> +	}
> +	# Store test name at the record
> +	$record{tests}{$cur_test} = 1;
> +
> +	for my $file_ref (@{$json->{'files'}}) {
> +		my $source = $file_ref->{'file'};
> +
> +		$files{$source} = 1;
> +		next if is_file_excluded($source);
> +
> +		# Parse functions
> +		for my $func_ref (@{$file_ref->{'functions'}}) {
> +			my $func = $func_ref->{'name'};
> +
> +			next if is_function_excluded($func);
> +
> +			# Negative gcov results are possible, as reported at:
> +			# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
> +			# Lcov ignores those. So, let's do the same here.
> +			$func_ref->{'execution_count'} = 0 if ($func_ref->{'execution_count'} < 0);
> +
> +			# Store the record
> +			for my $key (keys %$func_ref) {
> +				if ($key eq "execution_count") {
> +					$record{files}{$source}{func}{$func}{$key} += $func_ref->{$key};
> +				} else {
> +					$record{files}{$source}{func}{$func}{$key} = $func_ref->{$key};
> +				}
> +			}
> +
> +			$all_func{$func}{$source}->{ln} = $func_ref->{'start_line'};
> +			$all_func{$func}{$source}->{end_ln} = $func_ref->{'end_line'};
> +
> +			if ($func_ref->{'execution_count'} > 0) {
> +				$used_func{$func}{$source}->{count} += $func_ref->{'execution_count'};
> +				$was_used = 1;
> +			}
> +		}
> +		next if ($ignore_unused && !$was_used);
> +		$used_source{$source} = 1;
> +
> +		# Parse lines and branches
> +		for my $line_ref (@{$file_ref->{'lines'}}) {
> +			my $ln = $line_ref->{'line_number'};
> +
> +			# Negative gcov results are possible, as reported at:
> +			# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
> +			# Lcov ignores those. So, let's do the same here.
> +			$line_ref->{'count'} = 0 if ($line_ref->{'count'} < 0);
> +
> +			my $func = $line_ref->{'function_name'};
> +			if (!$func) {
> +				# Ignore DA/BRDA that aren't associated with
> +				# functions. Those are present on header files
> +				# (maybe defines?)
> +				next if (@func_include_regexes);
> +
> +				# Otherwise place them in separate
> +				$func = $before_sf;
> +			} else {
> +				next if is_function_excluded($func);
> +			}
> +
> +			# Store the record
> +			for my $key (keys %$line_ref) {
> +				next if ($key eq "line_number");
> +
> +				# Branches will be handled in separate
> +				next if ($key eq "branches");
> +				if ($key eq "count") {
> +					$record{files}{$source}{line}{$ln}{$key} += $line_ref->{$key};
> +				} else {
> +					$record{files}{$source}{line}{$ln}{$key} = $line_ref->{$key};
> +				}
> +			}
> +			$all_line{$source}{$ln} += $line_ref->{'count'};
> +
> +			my $i = 0;
> +			for my $branch_ref (@{$line_ref->{'branches'}}) {
> +				my $taken = $branch_ref->{'count'};
> +				my $where = sprintf "%d,%d,%d", $ln, 0, $i;
> +
> +				# Negative gcov results are possible, as
> +				# reported at:
> +				# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
> +				# Lcov ignores those. So, let's do the same
> +				# here.
> +				$branch_ref->{'count'} = 0 if ($branch_ref->{'count'} < 0);
> +
> +				for my $key (keys %$branch_ref) {
> +					if ($key eq "count") {
> +						$record{files}{$source}{line}{$ln}{branches}[$i]{$key} += $branch_ref->{$key};
> +					} else {
> +						$record{files}{$source}{line}{$ln}{branches}[$i]{$key} = $branch_ref->{$key};
> +					}
> +				}
> +
> +				$all_branch{$source}{$where}{count} += $taken;
> +				$i++;
> +			}
> +			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
> +				@{$record{files}{$source}{line}{$ln}{branches}} = ();
> +			}
> +		}
> +	}
> +
> +	# As the record was changed, we need to use a different format name
> +	$record{format_version} = "parse_info v1.0";
> +}
> +
> +sub parse_json_internal_format_v1($$)
> +{
> +	my $file = shift;
> +	my $json = shift;
> +
> +	my $was_used = 0;
> +	my $has_func = 0;
> +	my $ignore = 0;
> +
> +	# Store the common JSON data into the record
> +	for my $key (keys %$json) {
> +		next if ($key eq "files");
> +		next if ($key eq "functions");
> +		next if ($key eq "lines");
> +		# Store any extra data
> +		$record{$key} = $json->{$key};
> +	}
> +
> +	for my $test (keys %{$json->{'tests'}}) {
> +		$test_names{$test} = 1;
> +	}
> +
> +	for my $source (keys %{$json->{'files'}}) {
> +		$files{$source} = 1;
> +		next if is_file_excluded($source);
> +
> +		my $file_ref = \%{$json->{'files'}{$source}};
> +
> +		# Parse functions
> +		for my $func (keys %{$file_ref->{func}}) {
> +			next if is_function_excluded($func);
> +
> +			my $func_ref = \%{$file_ref->{func}{$func}};
> +
> +			# Store the record
> +			for my $key (keys %$func_ref) {
> +				if ($key eq "execution_count") {
> +					$record{files}{$source}{func}{$func}{$key} += $func_ref->{$key};
> +				} else {
> +					$record{files}{$source}{func}{$func}{$key} = $func_ref->{$key};
> +				}
> +			}
> +
> +			$all_func{$func}{$source}->{ln} = $func_ref->{'start_line'};
> +			$all_func{$func}{$source}->{end_ln} = $func_ref->{'end_line'};
> +
> +			if ($func_ref->{'execution_count'} > 0) {
> +				$used_func{$func}{$source}->{count} += $func_ref->{'execution_count'};
> +				$was_used = 1;
> +			}
> +		}
> +		next if ($ignore_unused && !$was_used);
> +		$used_source{$source} = 1;
> +
> +		# Parse lines and branches
> +		for my $ln (keys %{$file_ref->{line}}) {
> +			my $line_ref = \%{$file_ref->{line}{$ln}};
> +			my $func = $line_ref->{'function_name'};
> +			if (!$func) {
> +				# Ignore DA/BRDA that aren't associated with
> +				# functions. Those are present on header files
> +				# (maybe defines?)
> +				next if (@func_include_regexes);
> +
> +				# Otherwise place them in separate
> +				$func = $before_sf;
> +			} else {
> +				next if is_function_excluded($func);
> +			}
> +
> +			# Store the record
> +			for my $key (keys %$line_ref) {
> +				next if ($key eq "line_number");
> +
> +				# Branches will be handled in separate
> +				next if ($key eq "branches");
> +				if ($key eq "count") {
> +					$record{files}{$source}{line}{$ln}{$key} += $line_ref->{$key};
> +				} else {
> +					$record{files}{$source}{line}{$ln}{$key} = $line_ref->{$key};
> +				}
> +			}
> +			$all_line{$source}{$ln} += $line_ref->{'count'};
> +
> +			my $i = 0;
> +			for my $branch_ref (@{$line_ref->{'branches'}}) {
> +				my $taken = $branch_ref->{'count'};
> +				my $where = sprintf "%d,%d,%d", $ln, 0, $i;
> +
> +				# Negative gcov results are possible, as
> +				# reported at:
> +				# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
> +				# Lcov ignores those. So, let's do the same
> +				# here.
> +				$branch_ref->{'count'} = 0 if ($branch_ref->{'count'} < 0);
> +
> +				for my $key (keys %$branch_ref) {
> +					if ($key eq "count") {
> +						$record{files}{$source}{line}{$ln}{branches}[$i]{$key} += $branch_ref->{$key};
> +					} else {
> +						$record{files}{$source}{line}{$ln}{branches}[$i]{$key} = $branch_ref->{$key};
> +					}
> +				}
> +
> +				$all_branch{$source}{$where}{count} += $taken;
> +				$i++;
> +			}
> +			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
> +				@{$record{files}{$source}{line}{$ln}{branches}} = ();
> +			}
> +		}
> +	}
> +}
> +
> +sub read_json($)
> +{
> +	my $file = shift;
> +
> +	if (!$has_json_support) {
> +		die "Can't parse json as system doesn't have Cpanel::JSON::XS.\n";
> +	}
> +
> +	# Read JSON data
> +	open IN, $file or die "can't open $file";
> +	while (<IN>) {
> +		my $json = eval {
> +			Cpanel::JSON::XS::decode_json($_)
> +		};
> +
> +		if (!$json) {
> +			printf "Failed to parse file $file, line $.\n";
> +			next;
> +		}
> +		if ($json->{'format_version'} eq '1') {
> +			parse_json_gcov_v1($file, $json);
> +		} elsif ($json->{'format_version'} eq 'parse_info v1.0') {
> +			parse_json_internal_format_v1($file, $json);
> +		} else {
> +			if ($json->{'format_version'}) {
> +				die "Can't parse JSON version %d on file $file\n", $json->{'format_version'};
> +			}
> +			die "Unknown JSON format on file $file\n";
> +		}
> +	}
> +	close IN;
> +}
> +
> +sub read_info($)
>  {
>  	my $file = shift;
>  	my $was_used = 0;
> @@ -98,6 +386,7 @@ sub parse_info_data($)
>  			if ($1 ne $cur_test) {
>  				$cur_test = $1;
>  				$test_names{$cur_test} = 1;
> +				$record{tests}{$cur_test} = 1;
>  			}
>  			$source = $before_sf;
>  			$func = $before_sf;
> @@ -158,7 +447,7 @@ sub parse_info_data($)
>  
>  			$skip_func = 0;
>  
> -			$record{$source}{$func}{fn} = $ln;
> +			$record{files}{$source}{func}{$func}{start_line} = $ln;
>  			$all_func{$func}{$source}->{ln} = $ln;
>  			next;
>  		}
> @@ -186,7 +475,7 @@ sub parse_info_data($)
>  			$skip_func = 0;
>  			$was_used = 1;
>  
> -			$record{$source}{$func}{fnda} += $count;
> +			$record{files}{$source}{func}{$func}{execution_count} += $count;
>  			$used_func{$func}{$source}->{count} += $count;
>  			next;
>  		}
> @@ -200,15 +489,10 @@ sub parse_info_data($)
>  
>  		# FNF:<number of functions found>
>  		if (m/^FNF:(-?\d+)/) {
> -			$record{$source}{$func}{fnf} = $1;
>  			next;
>  		}
>  		# FNH:<number of function hit>
>  		if (m/^FNH:(-?\d+)/) {
> -			my $hits = $1;
> -			if (!defined($record{$source}{$func}{fnh}) || $record{$source}{$func}{fnh} < $hits) {
> -				$record{$source}{$func}{fnh} = $hits;
> -			}
>  			next;
>  		}
>  
> @@ -221,6 +505,10 @@ sub parse_info_data($)
>  			my $branch = $3;
>  			my $taken = $4;
>  
> +			if ($block != 0) {
> +				print "Warning: unexpected block $block at line $.\n";
> +			}
> +
>  			my $where = "$ln,$block,$branch";
>  
>  			$taken = 0 if ($taken eq '-');
> @@ -232,22 +520,17 @@ sub parse_info_data($)
>  
>  			$was_used = 1 if ($taken > 0);
>  
> -			$record{$source}{$func}{brda}{$where} += $taken;
> -			$all_branch{$source}{"$where"} += $taken;
> +			$record{files}{$source}{line}{$ln}{branches}[$branch]{count} += $taken;
> +			$all_branch{$source}{$where}{count} += $taken;
>  			next;
>  		}
>  
>  		# BRF:<number of branches found>
>  		if (m/^BRF:(-?\d+)/) {
> -			$record{$source}{$func}{brf} = $1;
>  			next;
>  		}
>  		# BRH:<number of branches hit>
>  		if (m/^BRH:(-?\d+)/) {
> -			my $hits = $1;
> -			if (!defined($record{$source}{$func}{brh}) || $record{$source}{$func}{brh} < $hits) {
> -				$record{$source}{$func}{brh} = $hits;
> -			}
>  			next;
>  		}
>  
> @@ -265,23 +548,23 @@ sub parse_info_data($)
>  
>  			$was_used = 1 if ($count > 0);
>  
> -			$record{$source}{$func}{da}{$ln} += $count;
> -			$all_line{$source}{"$ln"} += $count;
> +			$record{files}{$source}{line}{$ln}{count} += $count;
> +			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
> +				@{$record{files}{$source}{line}{$ln}{branches}} = ();
> +			}
> +
> +			$all_line{$source}{$ln} += $count;
> +
>  			next;
>  		}
>  
>  		# LF:<number of instrumented lines>
>  		if (m/^LF:(-?\d+)/) {
> -			$record{$source}{$func}{lf} = $1;
>  			next;
>  		}
>  
>  		# LH:<number of lines with a non-zero execution count>
>  		if (m/^LH:(-?\d+)/) {
> -			my $hits = $1;
> -			if (!defined($record{$source}{$func}{lh}) || $record{$source}{$func}{lh} < $hits) {
> -				$record{$source}{$func}{lh} = $hits;
> -			}
>  			next;
>  		}
>  
> @@ -306,74 +589,73 @@ sub sort_where($$)
>  	return $a[2] <=> $b[2];
>  }
>  
> -sub write_filtered_file($)
> +sub write_json_file($)
>  {
> -	my $filter = shift;
> +	my $fname = shift;
>  
> -	my $filtered = "";
> +	if (!$has_json_support) {
> +		die "Can't parse json as system doesn't have Cpanel::JSON::XS.\n";
> +	}
> +
> +	my $data = eval {
> +		Cpanel::JSON::XS::encode_json(\%record)
> +	};
> +
> +	open OUT, ">$fname" or die "Can't open $fname";
> +	print OUT $data or die "Failed to write to $fname";
> +	close OUT or die "Failed to close to $fname";
> +}
> +
> +sub write_info_file($)
> +{
> +	my $fname = shift;
> +	my $data = "";
>  
>  	if ($title eq "") {
>  		foreach my $testname(sort keys %test_names) {
> -			$filtered .= "TN:$testname\n";
> +			$data .= "TN:$testname\n";
>  		}
>  	} else {
> -		$filtered .= "TN:$title\n";
> +		$data .= "TN:$title\n";
>  	}
>  
> -	# Generates filtered data
> -	foreach my $source(sort keys %record) {
> +	# Fills $data with the contents to be stored at the file
> +	foreach my $source(sort keys %{$record{files}}) {
>  		next if (!$used_source{$source});
>  
>  		if ($source ne $before_sf) {
> -			$filtered .= "SF:$source\n";
> +			$data .= "SF:$source\n";
>  		}
>  
> -		foreach my $func(sort keys %{ $record{$source} }) {
> +		foreach my $func(sort keys %{ $record{files}{$source}{func} }) {
>  			if ($func ne $before_sf) {
>  				my $fn;
>  				my $fnda;
>  
> -				if (defined($record{$source}{$func}{fn})) {
> -					$filtered .= "FN:" . $record{$source}{$func}{fn} . ",$func\n";
> -				}
> -				if (defined($record{$source}{$func}{fnda})) {
> -					$filtered .= "FNDA:" . $record{$source}{$func}{fnda} . ",$func\n";
> +				if (defined($record{files}{$source}{func}{$func}{start_line})) {
> +					$data .= "FN:" . $record{files}{$source}{func}{$func}{start_line} . ",$func\n";
>  				}
> -				if ($record{$source}{fnf}) {
> -					$filtered .= "FNF:". $record{$source}{$func}{fnf} ."\n";
> +				if (defined($record{files}{$source}{func}{$func}{execution_count})) {
> +					$data .= "FNDA:" . $record{files}{$source}{func}{$func}{execution_count} . ",$func\n";
>  				}
> -				if ($record{$source}{fnh}) {
> -					$filtered .= "FNH:". $record{$source}{$func}{fnh} ."\n";
> -				}
> -			}
>  
> -			foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{$func}{da} }) {
> -				$filtered .= "DA:$ln," . $record{$source}{$func}{da}{$ln} . "\n";
>  			}
> -			foreach my $where(sort sort_where keys %{ $record{$source}{$func}{brda} }) {
> -				my $taken = $record{$source}{$func}{brda}{$where};
> +		}
> +
> +		foreach my $ln(sort { $a <=> $b } keys %{ $record{files}{$source}{line} }) {
> +			$data .= "DA:$ln," . $record{files}{$source}{line}{$ln}{count} . "\n";
> +			for (my $i = 0; $i < scalar @{$record{files}{$source}{line}{$ln}{branches}}; $i++) {
> +				my $taken = $record{files}{$source}{line}{$ln}{branches}[$i]{count};
>  				$taken = "-" if (!$taken);
> -				$filtered .= "BRDA:$where,$taken\n";
> -			}
> -			if ($record{$source}{$func}{brf}) {
> -				$filtered .= "BRF:". $record{$source}{$func}{brf} ."\n";
> -			}
> -			if ($record{$source}{$func}{brh}) {
> -				$filtered .= "BRH:". $record{$source}{$func}{brh} ."\n";
> -			}
> -			if ($record{$source}{$func}{lf}) {
> -				$filtered .= "LF:". $record{$source}{$func}{lf} ."\n";
> -			}
> -			if ($record{$source}{$func}{lh}) {
> -				$filtered .= "LH:". $record{$source}{$func}{lh} ."\n";
> +				$data .= "BRDA:$ln,0,$i,$taken\n";
>  			}
>  		}
>  
> -		$filtered .= "end_of_record\n";
> +		$data .= "end_of_record\n";
>  	}
> -	open OUT, ">$filter" or die "Can't open $filter";
> -	print OUT $filtered or die "Failed to write to $filter";
> -	close OUT or die "Failed to close to $filter";
> +	open OUT, ">$fname" or die "Can't open $fname";
> +	print OUT $data or die "Failed to write to $fname";
> +	close OUT or die "Failed to close to $fname";
>  }
>  
>  sub print_code_coverage($$$)
> @@ -463,7 +745,7 @@ sub gen_stats()
>  
>  		foreach my $where (keys(%{$all_branch{$source}})) {
>  			$stats{"branch_count"}++;
> -			$stats{"branch_reached"}++ if ($all_branch{$source}{$where} != 0);
> +			$stats{"branch_reached"}++ if ($all_branch{$source}{$where}{count} != 0);
>  		}
>  	}
>  
> @@ -622,7 +904,7 @@ sub generate_report($)
>  		}
>  		foreach my $source (keys(%{$report{$f}{"all_branch"}})) {
>  			foreach my $where (keys(%{$report{$f}{"all_branch"}{$source}})) {
> -				$all_branch{$source}{"$where"} += $report{$f}{"all_branch"}{$source}{$where};
> +				$all_branch{$source}{"$where"}{count} += $report{$f}{"all_branch"}{$source}{$where}{count};
>  			}
>  		}
>  		for my $source(keys(%{$report{$f}{"files"}})) {
> @@ -902,7 +1184,7 @@ sub check_source_branches()
>  
>  		my @lines;
>  		foreach my $where (sort keys %{$all_branch{$source}}) {
> -			my $taken = $all_branch{$source}{$where};
> +			my $taken = $all_branch{$source}{$where}{count};
>  			next if ($taken > 0);
>  
>  			next if !($where =~ m/^(-?\d+),(-?\d+),(-?\d+)/);
> @@ -913,13 +1195,14 @@ sub check_source_branches()
>  			$branch = $3;
>  
>  			if (!@lines) {
> -				open IN, "$source";
> +				open IN, "$source" || die "File $source not found. Can't check branches\n";
>  				@lines = <IN>;
>  				close IN;
>  			}
>  
>  			if ($ln >= $#lines) {
> -				print "Error: $ln is bigger than $#lines. Can't print branch!\n";
> +				die "$source:$ln line is bigger than the number of lines at the file ($#lines lines)\n";
> +				return;
>  			}
>  
>  			my $func = $all_branch{$source}{$where}{func};
> @@ -971,7 +1254,7 @@ sub check_source_branches()
>  my $print_used;
>  my $print_unused;
>  my $stat;
> -my $filter;
> +my $output_file;
>  my $help;
>  my $man;
>  my $func_filters;
> @@ -986,7 +1269,7 @@ GetOptions(
>  	"print-coverage|print_coverage|print|p" => \$print_used,
>  	"print-unused|u" => \$print_unused,
>  	"stat|statistics" => \$stat,
> -	"output|o=s" => \$filter,
> +	"output|o=s" => \$output_file,
>  	"verbose|v" => \$verbose,
>  	"ignore-unused|ignore_unused" => \$ignore_unused,
>  	"only-i915|only_i915" => \$only_i915,
> @@ -1018,9 +1301,9 @@ if ($#ARGV < 0) {
>  }
>  
>  # At least one action should be specified
> -pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report && !$check_branches);
> +pod2usage(1) if (!$print_used && !$output_file && !$stat && !$print_unused && !$gen_report && !$check_branches);
>  
> -pod2usage(1) if ($gen_report && ($print_used || $filter || $stat || $print_unused));
> +pod2usage(1) if ($gen_report && ($print_used || $output_file || $stat || $print_unused));
>  
>  my $filter_str = "";
>  my $has_filter;
> @@ -1063,7 +1346,11 @@ if ($ignore_unused) {
>  }
>  
>  foreach my $f (@ARGV) {
> -	parse_info_data($f);
> +	if ($f =~ /.json$/) {
> +		read_json($f);
> +	} else {
> +		read_info($f);
> +	}
>  
>  	if ($gen_report) {
>  		$f =~ s,.*/,,;
> @@ -1137,8 +1424,12 @@ if ($show_files) {
>  	}
>  }
>  
> -if ($filter) {
> -	write_filtered_file($filter);
> +if ($output_file) {
> +	if ($output_file =~ /.json$/) {
> +		write_json_file($output_file);
> +	} else {
> +		write_info_file($output_file);
> +	}
>  }
>  
>  __END__
> -- 
> 2.39.0
> 
