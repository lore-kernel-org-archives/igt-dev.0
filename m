Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE2010E289
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 07:03:21 +0000 (UTC)
Date: Thu, 14 Apr 2022 09:03:14 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Message-ID: <20220414090314.01defb92@maurocar-mobl2>
In-Reply-To: <2b01e83c-9e1d-09a1-630a-a03767633f0e@intel.com>
References: <cover.1649753814.git.mchehab@kernel.org>
 <44750fbf7c569f1da80a8f443b07df963730e28f.1649753814.git.mchehab@kernel.org>
 <2b01e83c-9e1d-09a1-630a-a03767633f0e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v2 11/12] code_cov_parse_info: add support for
 exclude filters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 13 Apr 2022 15:53:01 +0200
Andrzej Hajda <andrzej.hajda@intel.com> wrote:

> On 12.04.2022 10:59, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >
> > It is interesting to have support not only for including, but
> > also for excluding functions and files. Also, it is trivial to
> > have support for it.
> >
> > When either one or both source/function filters are enabled, it
> > will print at the console the regular expressions that are applied
> > to functions and sources (if any), e. g.:
> >
> > $ cat << END >f1
> > +i915
> > gem
> >
> > -  display
> > -selftest
> > END
> > $ cat << END >f2
> > 	-/selftests
> > END  
> 
> I am not sure if we really needs so tolerant parser, up to you.
> 
> > $ code_cov_parse_info dg1.info dg2.info --func-filter f1 --source-filters f2 --stat  
> 
> s/func-filter/func-filters/
> 
> Btw, maybe would be good to have inline fliters:
> 
> $ code_cov_parse_info dg1.info dg2.info --func-filter '+i915,+gem,-display,-selftest' --source-filters '-/selftest' --stat
> 
> For this I would make '+/-' at the beginning required, just an idea, 
> could be implemented later.

Yeah, this would make easier for simple cases. Yet, a file would help
to have a more complex ruleset and add some documentation on it, as
comments.

One alternative would be to have both (using different options).

Yet, using commas there is not a good idea... The Linux kernel has
lots of files now with commas, at DT. Ok, those aren't supposed to
contain code, but nothing prevents that someone would add commas also
on c files on some future.

So, the safest option would be to use an array at getopt, and
having multiple tags, like:

	code_cov_parse_info dg1.info dg2.info --func-filter '+i915" --func-filter "+gem"

On such case, we could use something like:

	code_cov_parse_info dg1.info dg2.info --include-func i915 --include-func gem --exclude-func selftest

There are two interesting size effects with that:

1) no need to add any parser for it. Just adding:

	--- a/scripts/code_cov_parse_info
	+++ b/scripts/code_cov_parse_info
	@@ -811,7 +811,11 @@ GetOptions(
	 	"only-i915|only_i915" => \$only_i915,
	 	"only-drm|only_drm" => \$only_drm,
	 	"func-filters|f=s" => \$func_filters,
	+	"include-func=s" => \@func_regexes,
	+	"exclude-func=s" => \@func_exclude_regexes,
	 	"source-filters|S=s" => \$src_filters,
	+	"include-source=s" => \@src_regexes,
	+	"exclude-source=s" => \@src_exclude_regexes,
	 	"show-files|show_files" => \$show_files,
	 	"show-lines|show_lines" => \$show_lines,
	 	"report|r=s" => \$gen_report,

Is enough for it to work (plus documentation and some extra logic to
print the filters).

2) it can be used together with the files.

3) when adding support for properly reporting the filters, the
   the logic that handles the two fixed filters (--only-i915 and
   --only-drm filters) can be simplified.

4) by removing the specific implementation for --only-i915 and
   --only-drm, it is now possible to show all regexes applied to the
   file, e. g.:

	$ scripts/code_cov_parse_info --stat dg1.info dg2.info --exclude-func intel_display_power --only-drm --only-i915 --source-filters my_filter.txt 
	  lines......: 50.5% (30021 of 59401 lines)
	  functions..: 58.4% (2685 of 4599 functions)
	  branches...: 31.8% (12949 of 40751 branches)
	Filters......: function regex (not match: m`intel_display_power`), source regex (not match: m`selftest` m`trace.*.h` m`drm.*.h` m`display` and match: m`drm/i915` m`drm/ttm` m`drm/vgem` m`i915` m`gem`) and ignored source files where none of its code ran.
	Source files.: 20.56% (146 of 710 total), 82.95% (146 of 176 filtered)
	Number of tests: 152

So, I ended opting to do that. I'm enclosing the diff against this
patch at the end.

> 
> >    lines......: 72.1% (176 of 244 lines)
> >    functions..: 77.3% (17 of 22 functions)
> >    branches...: 50.0% (68 of 136 branches)
> > Filters......: function regex (not match: m`display` m`selftest` and match: m`i915` m`gem`), source regex (match: m`/selftest`) and ignored source files where none of its code ran.  
> 
> I would use then here "+i915,+gem,-display,-selftest" format, just 
> shorter lines.
> 
> > Source files.: 0.99% (7 of 710 total), 77.78% (7 of 9 filtered)
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---  
> 
> 
> With fixed typo, and optionally implemented suggestions:


> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks! Will add it to the new version.

> 
> Regards
> Andrzej
> 


diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index d6ec5695a358..77291eb69405 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -26,8 +26,6 @@ my @src_exclude_regexes;
 
 my $verbose = 0;
 my $ignore_unused = 0;
-my $only_i915 = 0;
-my $only_drm = 0;
 my $skip_func = 0;
 
 sub is_function_excluded($)
@@ -53,27 +51,6 @@ sub filter_file($)
 {
 	my $s = shift;
 
-	if ($only_drm) {
-		# Please keep --only-drm doc updated with any changes her
-		if ($s =~ m/\.h$/) {
-			if ($s =~ m/trace/ || !($s =~ m/drm/)) {
-				return 1;
-			}
-		}
-	}
-
-	if ($only_i915) {
-		# Please keep --only-i915 doc updated with any changes here
-		if ($s =~ m/selftest/) {
-			return 1;
-		}
-
-		# Please keep --only-i915 doc updated with any changes here
-		if (!($s =~ m#drm/i915/# || $s =~ m#drm/ttm# || $s =~ m#drm/vgem#)) {
-			return 1;
-		}
-	}
-
 	return 0 if (!@src_regexes && !@src_exclude_regexes);
 
 	foreach my $r (@src_exclude_regexes) {
@@ -506,26 +483,43 @@ sub open_filter_file($$$)
 	my $match_str = "";
 	my $not_match_str = "";
 	my $filter = "";
+	my $i;
 
-	open IN, $fname or die "Can't open $fname";
-	while (<IN>) {
-		s/^\s+//;
-		s/\s+$//;
-		next if (m/^#/ || m/^$/);
-		if (m/^([+\-])\s*(.*)/) {
-			if ($1 eq "+") {
-				$match_str .= sprintf "m`$2` ";
-				push @{$include}, qr /$2/;
+	# Handle regexes that came from command line params
+
+	for ($i = 0;$i < scalar(@{$include}); $i++) {
+		my $op = @{$include}[$i];
+		$match_str .= sprintf "m`$op` ";
+		@{$include}[$i] = qr /$op/;
+	}
+
+	for ($i = 0;$i < scalar(@{$exclude}); $i++) {
+		my $op = @{$exclude}[$i];
+		$not_match_str .= sprintf "m`$op` ";
+		@{$exclude}[$i] = qr /$op/;
+	}
+
+	if ($fname) {
+		open IN, $fname or die "Can't open $fname";
+		while (<IN>) {
+			s/^\s+//;
+			s/\s+$//;
+			next if (m/^#/ || m/^$/);
+			if (m/^([+\-])\s*(.*)/) {
+				if ($1 eq "+") {
+					$match_str .= sprintf "m`$2` ";
+					push @{$include}, qr /$2/;
+				} else {
+					$not_match_str .= sprintf "m`$2` ";
+					push @{$exclude}, qr /$2/;
+				}
 			} else {
-				$not_match_str .= sprintf "m`$2` ";
-				push @{$exclude}, qr /$2/;
+				$match_str .= sprintf "m`$_` ";
+				push @{$include}, qr /$_/;
 			}
-		} else {
-			$match_str .= sprintf "m`$_` ";
-			push @{$include}, qr /$_/;
 		}
+		close IN;
 	}
-	close IN;
 
 	$filter .= "not match: $not_match_str" if ($not_match_str);
 	if ($match_str) {
@@ -800,6 +794,8 @@ my $func_filters;
 my $src_filters;
 my $show_files;
 my $show_lines;
+my $only_i915;
+my $only_drm;
 
 GetOptions(
 	"print-coverage|print_coverage|print|p" => \$print_used,
@@ -811,7 +807,11 @@ GetOptions(
 	"only-i915|only_i915" => \$only_i915,
 	"only-drm|only_drm" => \$only_drm,
 	"func-filters|f=s" => \$func_filters,
+	"include-func=s" => \@func_regexes,
+	"exclude-func=s" => \@func_exclude_regexes,
 	"source-filters|S=s" => \$src_filters,
+	"include-source=s" => \@src_regexes,
+	"exclude-source=s" => \@src_exclude_regexes,
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
 	"report|r=s" => \$gen_report,
@@ -838,16 +838,31 @@ pod2usage(1) if ($gen_report && ($print_used || $filter || $stat || $print_unuse
 
 my $filter_str = "";
 my $has_filter;
+my $str;
 
-if ($func_filters) {
-	my $str = open_filter_file($func_filters, \@func_regexes, \@func_exclude_regexes);
+if ($only_i915) {
+	# Please keep in sync with the documentation
+	push @src_exclude_regexes, "selftest";
+	push @src_regexes, "drm/i915";
+	push @src_regexes, "drm/ttm";
+	push @src_regexes, "drm/vgem";
+}
+
+if ($only_drm) {
+	# Please keep in sync with the documentation
+	push @src_exclude_regexes, "trace.*\.h";
+	push @src_exclude_regexes, "drm.*\.h";
+}
+
+$str = open_filter_file($func_filters, \@func_regexes, \@func_exclude_regexes);
+if ($str) {
 	$filter_str .= "," if ($filter_str ne "");
 	$filter_str .= " function regex ($str)";
 	$has_filter = 1;
 }
 
-if ($src_filters) {
-	my $str = open_filter_file($src_filters, \@src_regexes, \@src_exclude_regexes);
+$str = open_filter_file($src_filters, \@src_regexes, \@src_exclude_regexes);
+if ($str) {
 	$filter_str .= "," if ($filter_str ne "");
 	$filter_str .= " source regex ($str)";
 	$has_filter = 1;
@@ -855,17 +870,6 @@ if ($src_filters) {
 
 $ignore_unused = 1 if (@func_regexes || @func_exclude_regexes);
 
-if ($only_i915) {
-	$filter_str = " ignored non-i915 files";
-	$has_filter = 1;
-}
-
-if ($only_drm) {
-	$filter_str .= "," if ($filter_str ne "");
-	$filter_str .= " ignored non-drm headers";
-	$has_filter = 1;
-}
-
 if ($ignore_unused) {
 	$filter_str .= "," if ($filter_str ne "");
 	$filter_str .= " ignored source files where none of its code ran";
@@ -1086,6 +1090,24 @@ expressions from the B<[filter's file]> will be ignored.
 Please notice that, when this filter is used, B<--ignore-unused> will be
 automaticaly enabled, as the final goal is to report per-function usage.
 
+=item B<--include-func> B<regex>
+
+Include B<regex> to the function filter. Can be used multiple times.
+
+When used together with B<--func-filters>, regexes here are handled first.
+
+Please notice that, when this filter is used, B<--ignore-unused> will be
+automaticaly enabled, as the final goal is to report per-function usage.
+
+=item B<--exclude-func> B<regex>
+
+Include B<regex> to the function filter. Can be used multiple times.
+
+When used together with B<--func-filters>, regexes here are handled first.
+
+Please notice that, when this filter is used, B<--ignore-unused> will be
+automaticaly enabled, as the final goal is to report per-function usage.
+
 =item B<--source-filters>  B<[filter's file]> or B<-S>  B<[filter's file]>
 
 Use a file containing regular expressions to filter source files.
@@ -1116,6 +1138,18 @@ When both include and exclude regexes are found, exclude regexes are
 applied first and any functions that don't match the include regular
 expressions from the B<[filter's file]> will be ignored.
 
+=item B<--include-src> B<regex>
+
+Include B<regex> to the sources filter. Can be used multiple times.
+
+When used together with B<--src-filters>, regexes here are handled first.
+
+=item B<--exclude-src> B<regex>
+
+Include B<regex> to the sources filter. Can be used multiple times.
+
+When used together with B<--src-filters>, regexes here are handled first.
+
 =item B<--ignore-unused> or B<--ignore_unused>
 
 Filters out unused C files and headers from the code coverage results.

