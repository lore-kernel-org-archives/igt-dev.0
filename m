Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20180709132004.14468-1-tvrtko.ursulin@linux.intel.com>
 <20180709132004.14468-3-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <2977b001-a780-e19e-60e6-53c3c4744f54@Intel.com>
Date: Wed, 11 Jul 2018 15:07:12 -0700
MIME-Version: 1.0
In-Reply-To: <20180709132004.14468-3-tvrtko.ursulin@linux.intel.com>
Content-Type: multipart/mixed; boundary="------------72B610CBC276117C0582EF60"
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t 02/11] trace.pl: Improve readability
 of graphical timeline representation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------72B610CBC276117C0582EF60
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/9/2018 6:19 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> We add stripes for different stages of request execution so it is easier
> to follow one context in the multi-colour mode.
>
> Vertical stripe pattern indicates pipeline "blockages" - requests waiting
> for dependencies before they are runnable.
>
> Diagonal stripes indicate runnable requests waiting for GPU time.
>
> Horizontal strips are requests executing on the GPU.
>
> Also use this new multi-coloured mode from media-bench.pl.
>
> v2:
>   John Harrison:
>   * Mention media-bench.pl in the commit.
>   * Fix HTML for single colour mode.
>
> v3:
>   * Rebase.
>   * Apply stripes to legacy colouring as well.
>
> v4:
>   John Harrison:
>   * Use per context colours for ctxsave and incomplete boxes.
>   * Clearer timeline legend.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   scripts/media-bench.pl |   2 +-
>   scripts/trace.pl       | 112 ++++++++++++++++++++++++++++++++---------
>   2 files changed, 90 insertions(+), 24 deletions(-)
>
> diff --git a/scripts/media-bench.pl b/scripts/media-bench.pl
> index c5628c7f2836..375844d9cdf6 100755
> --- a/scripts/media-bench.pl
> +++ b/scripts/media-bench.pl
> @@ -207,7 +207,7 @@ sub trace_workload
>   	show_cmd($cmd);
>   	system($cmd);
>   
> -	$cmd = "perf script | $tracepl --html -x ctxsave -s ";
> +	$cmd = "perf script | $tracepl --html -x ctxsave -s -c ";
>   	$cmd .= join ' ', map("-i $_", @skip_engine);
>   	$cmd .= " > ${file}.html";
>   	show_cmd($cmd);
> diff --git a/scripts/trace.pl b/scripts/trace.pl
> index fd414f5a4b1e..1ec8b297d15e 100755
> --- a/scripts/trace.pl
> +++ b/scripts/trace.pl
> @@ -727,9 +727,14 @@ foreach my $key (keys %reqwait) {
>   say sprintf('GPU: %.2f%% idle, %.2f%% busy',
>   	     $flat_busy{'gpu-idle'}, $flat_busy{'gpu-busy'}) unless $html;
>   
> -my $queued_colour = $colour_contexts ? 'multi-colour light' : 'blue';
> -my $runnable_colour = $colour_contexts ? 'multi-colour dark' : 'grey';
> -my $execute_colour = $colour_contexts ? 'multi-colour' : 'pink';
> +my $timeline_text = $colour_contexts ?
> +		    'Per context coloured shading like:' : 'Box shading like:';
> +
> +my $queued_style = box_style($min_ctx, 'queue');
> +my $ready_style = box_style($min_ctx, 'ready');
> +my $execute_style = box_style($min_ctx, 'execute');
> +my $ctxsave_style = box_style($min_ctx, 'ctxsave');
> +my $incomplete_style = box_style($min_ctx, 'incomplete');

In context colouring mode, the legend is not especially useful as it is 
only coloured for one particular context (which at least for all of my 
traces, is the system context that only appears at the very end as a 
flush) and has no indication that other contexts will be significantly 
different. Also, I find the black text is really hard to read against 
the dark colour backgrounds. Plus the boxes are too small to actually 
work out what the shading is (for 'ready' and 'incomplete' if not all of 
them).

See attached patch for some tweaks. Basically, add all contexts to the 
key in colour mode, make the boxes bigger and use white text for most of 
it. Although the thought occurs that it might be worth limiting the 
legend to only four or five contexts and just putting an 'etc' at the 
end if there are more. Otherwise a trace with hundreds of contexts could 
be a problem! I'm guessing in that case, the difference in colour from 
one context to the next will be pretty minimal anyway.

>   
>   print <<ENDHTML if $html;
>   <!DOCTYPE HTML>
> @@ -751,9 +756,28 @@ print <<ENDHTML if $html;
>   <button onclick="toggleStackSubgroups()">Toggle stacking</button>
>   
>   <p>
> -$execute_colour = requests executing on the GPU<br>
> -$runnable_colour = runnable requests waiting for a slot on GPU<br>
> -$queued_colour = requests waiting on fences and dependencies before they are runnable<br>
> +<b>Timeline request view:</b>
> +<table>
> +<tr><td colspan='4'>$timeline_text</td></tr>
> +<tr>
> +<td align='center'><div style='$queued_style'>QUEUED</div></td>
> +<td align='center'><div style='$ready_style'>READY</div></td>
> +<td align='center'><div style='$execute_style'>EXECUTE</div></td>
> +<td align='center'><div style='$ctxsave_style'>CTXSAVE</div></td>
> +</tr><tr>
> +<td></td>
> +<td></td>
> +<td align='center'><div style='$incomplete_style'>(INCOMPLETE)</div></td>
> +<td></td>
> +</tr/></table>
> +</p>
> +<p>
> +<small>
> +QUEUED = requests executing on the GPU<br>
> +READY = runnable requests waiting for a slot on GPU<br>
> +EXECUTE = requests waiting on fences and dependencies before they are runnable<br>
> +CTXSAVE = GPU saving the context image<br>
> +</small>
>   </p>
>   <p>
>   Boxes are in format 'ctx-id/seqno'.
> @@ -873,17 +897,31 @@ sub sortQueue {
>   
>   sub ctx_colour
>   {
> -	my ($ctx, $stage) = (@_);
> +	my ($ctx, $stage, $lfac) = (@_);
>   	my ($s, $l);
>   	my $val;
>   
>   	unless ($colour_contexts) {
>   		if ($stage eq 'queue') {
> -			return 'lightblue;';
> +			$val = 210;
> +			$s = 65;
> +			$l = 52;
>   		} elsif ($stage eq 'ready') {
> -			return 'lightgrey;';
> +			$val = 0;
> +			$s = 0;
> +			$l = 47;
>   		} elsif ($stage eq 'execute') {
> -			return 'pink;';
> +			$val = 346;
> +			$s = 68;
> +			$l = 65;
> +		} elsif ($stage eq 'ctxsave') {
> +			$val = 26;
> +			$s = 90;
> +			$l = 52;
> +		} elsif ($stage eq 'incomplete') {
> +			$val = 0;
> +			$s = 85;
> +			$l = 50;
>   		}
>   	} else {
>   		if ($stage eq 'queue') {
> @@ -895,12 +933,45 @@ sub ctx_colour
>   		} elsif ($stage eq 'execute') {
>   			$s = 80;
>   			$l = 65;
> +		} elsif ($stage eq 'ctxsave') {
> +			$s = 75;
> +			$l = 70;
> +		} elsif ($stage eq 'incomplete') {
> +			$s = 80;
> +			$l = 25;
>   		}
> +
> +		$val = int(360 / ($max_ctx - $min_ctx + 1)) * ($ctx - $min_ctx);
>   	}
>   
> -	$val = int(360 / ($max_ctx - $min_ctx + 1)) * ($ctx - $min_ctx);
> +	$l = int($l * $lfac);
>   
> -	return "hsl($val, $s%, $l%);";
> +	return "hsl($val, $s%, $l%)";
> +}
> +
> +sub box_style
> +{
> +	my ($ctx, $stage) = @_;
> +	my $deg;
> +
> +	if ($stage eq 'queue') {
> +		$deg = 90;
> +	} elsif ($stage eq 'ready') {
> +		$deg = 45;
> +	} elsif ($stage eq 'execute') {
> +		$deg = 0;
> +	} elsif ($stage eq 'ctxsave') {
> +		$deg = 105;
> +	} elsif ($stage eq 'incomplete') {
> +		$deg = 0;
> +	}
> +
> +	return 'color: black; background: repeating-linear-gradient(' .
> +		$deg . 'deg, ' .
> +		ctx_colour($ctx, $stage, 1.0) . ', ' .
> +		ctx_colour($ctx, $stage, 1.0) . ' 10px, ' .
> +		ctx_colour($ctx, $stage, 0.90) . ' 10px, ' .
> +		ctx_colour($ctx, $stage, 0.90) . ' 20px);';
>   }
>   
>   my $i = 0;
> @@ -917,8 +988,7 @@ foreach my $key (sort sortQueue keys %db) {
>   	# submit to execute
>   	unless (exists $skip_box{'queue'}) {
>   		$skey = 2 * $max_seqno * $ctx + 2 * $seqno;
> -		$style = 'color: black; background-color: ' .
> -			 ctx_colour($ctx, 'queue');
> +		$style = box_style($ctx, 'queue');
>   		$content = "$name<br>$db{$key}->{'submit-delay'}us <small>($db{$key}->{'execute-delay'}us)</small>";
>   		$startend = 'start: \'' . ts($queue) . '\', end: \'' . ts($submit) . '\'';
>   		print "\t{id: $i, key: $skey, $type group: $group, subgroup: 1, subgroupOrder: 1, content: '$content', $startend, style: \'$style\'},\n";
> @@ -928,8 +998,7 @@ foreach my $key (sort sortQueue keys %db) {
>   	# execute to start
>   	unless (exists $skip_box{'ready'}) {
>   		$skey = 2 * $max_seqno * $ctx + 2 * $seqno + 1;
> -		$style = 'color: black; background-color: ' .
> -			 ctx_colour($ctx, 'ready');
> +		$style = box_style($ctx, 'ready');
>   		$content = "<small>$name<br>$db{$key}->{'execute-delay'}us</small>";
>   		$startend = 'start: \'' . ts($submit) . '\', end: \'' . ts($start) . '\'';
>   		print "\t{id: $i, key: $skey, $type group: $group, subgroup: 1, subgroupOrder: 2, content: '$content', $startend, style: \'$style\'},\n";
> @@ -939,12 +1008,9 @@ foreach my $key (sort sortQueue keys %db) {
>   	# start to user interrupt
>   	unless (exists $skip_box{'execute'}) {
>   		$skey = -2 * $max_seqno * $ctx - 2 * $seqno - 1;
> -		if (exists $db{$key}->{'incomplete'}) {
> -			$style = 'color: white; background-color: red;';
> -		} else {
> -			$style = 'color: black; background-color: ' .
> -				  ctx_colour($ctx, 'execute');
> -		}
> +		$style = box_style($ctx,
> +				   exists $db{$key}->{'incomplete'} ?
> +				   'incomplete' : 'execute');
>   		$content = "$name <small>$db{$key}->{'port'}</small>";
>   		$content .= ' <small><i>???</i></small> ' if exists $db{$key}->{'incomplete'};
>   		$content .= ' <small><i>++</i></small> ' if exists $db{$key}->{'no-end'};
> @@ -958,7 +1024,7 @@ foreach my $key (sort sortQueue keys %db) {
>   	# user interrupt to context complete
>   	unless (exists $skip_box{'ctxsave'}) {
>   		$skey = -2 * $max_seqno * $ctx - 2 * $seqno;
> -		$style = 'color: black; background-color: orange;';
> +		$style = box_style($ctx, 'ctxsave');
>   		my $ctxsave = $db{$key}->{'end'} - $db{$key}->{'notify'};
>   		$content = "<small>$name<br>${ctxsave}us</small>";
>   		$content .= ' <small><i>???</i></small> ' if exists $db{$key}->{'incomplete'};


--------------72B610CBC276117C0582EF60
Content-Type: text/plain; charset=UTF-8;
 name="0001-trace.pl-Improved-key-colours.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-trace.pl-Improved-key-colours.patch"

RnJvbSBkZjY2ZTEzNTNjYzk1NTBmYjBhOGE3OWI5OGRjOGY4ZGM4NWVkOTkzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKb2huIEhhcnJpc29uIDxKb2huLkMuSGFycmlzb25A
SW50ZWwuY29tPgpEYXRlOiBUdWUsIDEwIEp1bCAyMDE4IDE0OjUzOjE2IC0wNzAwClN1Ympl
Y3Q6IFtQQVRDSCAwMS8yMV0gdHJhY2UucGw6IEltcHJvdmVkIGtleS9jb2xvdXJzCgotLS0K
IHNjcmlwdHMvdHJhY2UucGwgfCA1MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyks
IDE5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3NjcmlwdHMvdHJhY2UucGwgYi9zY3Jp
cHRzL3RyYWNlLnBsCmluZGV4IDYwYThlNDQxLi4zODM3OTczNyAxMDA3NTUKLS0tIGEvc2Ny
aXB0cy90cmFjZS5wbAorKysgYi9zY3JpcHRzL3RyYWNlLnBsCkBAIC03NDAsNiArNzQwLDI5
IEBAIG15ICR0aW1lbGluZV90ZXh0ID0gJGNvbG91cl9jb250ZXh0cyA/CiAJCSAgICAnUGVy
IGNvbnRleHQgY29sb3VyZWQgc2hhZGluZyBsaWtlOicgOiAnQm94IHNoYWRpbmcgbGlrZTon
OwogCiBteSAlY3R4X2NvbG91cnM7CitteSAkY3R4X3RhYmxlOworCitzdWIgZ2VuZXJhdGVf
Y3R4X3RhYmxlCit7CisJbXkgQHN0YXRlcyA9ICgicXVldWUiLCAicmVhZHkiLCAiZXhlY3V0
ZSIsICJjdHhzYXZlIiwgImluY29tcGxldGUiKTsKKwlteSBAY3R4dHM7CisKKwlpZiggJGNv
bG91cl9jb250ZXh0cyApIHsKKwkJQGN0eHRzID0gc29ydCBrZXlzICVjdHhkYjsKKwl9IGVs
c2UgeworCQlAY3R4dHMgPSAoJG1pbl9jdHgpOworCX0KKworCSRjdHhfdGFibGUgPSAiIjsK
Kwlmb3JlYWNoIG15ICRjdHggKEBjdHh0cykgeworCQkkY3R4X3RhYmxlIC49ICI8dHI+XG4i
OworCQkkY3R4X3RhYmxlIC49ICIgIDx0ZD5Db250ZXh0OiAkY3R4PC90ZD5cbiIgaWYgJGNv
bG91cl9jb250ZXh0czsKKwkJZm9yZWFjaCBteSAkc3RhdGUgKEBzdGF0ZXMpIHsKKwkJCSRj
dHhfdGFibGUgLj0gIiAgPHRkIGFsaWduPSdjZW50ZXInPjxkaXYgc3R5bGU9JyIgLiBib3hf
c3R5bGUoJGN0eCwgJHN0YXRlKSAuICInPiZuYnNwOyZuYnNwOyZuYnNwOyIgLiB1Yygkc3Rh
dGUpIC4gIiZuYnNwOyZuYnNwOyZuYnNwOzxwPiZuYnNwOzwvZGl2PjwvdGQ+XG4iOworCQl9
CisJCSRjdHhfdGFibGUgLj0gIjwvdHI+IjsKKwl9Cit9CiAKIHN1YiBnZW5lcmF0ZV9jdHhf
Y29sb3VycwogewpAQCAtNzUzLDEyICs3NzYsNyBAQCBzdWIgZ2VuZXJhdGVfY3R4X2NvbG91
cnMKIAogCiBnZW5lcmF0ZV9jdHhfY29sb3VycygpIGlmICRodG1sIGFuZCAkY29sb3VyX2Nv
bnRleHRzOwotCi1teSAkcXVldWVkX3N0eWxlID0gYm94X3N0eWxlKCRtaW5fY3R4LCAncXVl
dWUnKTsKLW15ICRyZWFkeV9zdHlsZSA9IGJveF9zdHlsZSgkbWluX2N0eCwgJ3JlYWR5Jyk7
Ci1teSAkZXhlY3V0ZV9zdHlsZSA9IGJveF9zdHlsZSgkbWluX2N0eCwgJ2V4ZWN1dGUnKTsK
LW15ICRjdHhzYXZlX3N0eWxlID0gYm94X3N0eWxlKCRtaW5fY3R4LCAnY3R4c2F2ZScpOwot
bXkgJGluY29tcGxldGVfc3R5bGUgPSBib3hfc3R5bGUoJG1pbl9jdHgsICdpbmNvbXBsZXRl
Jyk7CitnZW5lcmF0ZV9jdHhfdGFibGUoKSBpZiAkaHRtbDsKIAogcHJpbnQgPDxFTkRIVE1M
IGlmICRodG1sOwogPCFET0NUWVBFIEhUTUw+CkBAIC03ODAsMjQgKzc5OCwxNiBAQCBwcmlu
dCA8PEVOREhUTUwgaWYgJGh0bWw7CiA8Yj5UaW1lbGluZSByZXF1ZXN0IHZpZXc6PC9iPgog
PHRhYmxlPgogPHRyPjx0ZCBjb2xzcGFuPSc0Jz4kdGltZWxpbmVfdGV4dDwvdGQ+PC90cj4K
LTx0cj4KLTx0ZCBhbGlnbj0nY2VudGVyJz48ZGl2IHN0eWxlPSckcXVldWVkX3N0eWxlJz5R
VUVVRUQ8L2Rpdj48L3RkPgotPHRkIGFsaWduPSdjZW50ZXInPjxkaXYgc3R5bGU9JyRyZWFk
eV9zdHlsZSc+UkVBRFk8L2Rpdj48L3RkPgotPHRkIGFsaWduPSdjZW50ZXInPjxkaXYgc3R5
bGU9JyRleGVjdXRlX3N0eWxlJz5FWEVDVVRFPC9kaXY+PC90ZD4KLTx0ZCBhbGlnbj0nY2Vu
dGVyJz48ZGl2IHN0eWxlPSckY3R4c2F2ZV9zdHlsZSc+Q1RYU0FWRTwvZGl2PjwvdGQ+Ci08
L3RyPjx0cj4KLTx0ZD48L3RkPgotPHRkPjwvdGQ+Ci08dGQgYWxpZ249J2NlbnRlcic+PGRp
diBzdHlsZT0nJGluY29tcGxldGVfc3R5bGUnPihJTkNPTVBMRVRFKTwvZGl2PjwvdGQ+Ci08
dGQ+PC90ZD4KLTwvdHIvPjwvdGFibGU+CiskY3R4X3RhYmxlCis8L3RhYmxlPgogPC9wPgog
PHA+CiA8c21hbGw+Ci1RVUVVRUQgPSByZXF1ZXN0cyBleGVjdXRpbmcgb24gdGhlIEdQVTxi
cj4KK1FVRVVFID0gcmVxdWVzdHMgZXhlY3V0aW5nIG9uIHRoZSBHUFU8YnI+CiBSRUFEWSA9
IHJ1bm5hYmxlIHJlcXVlc3RzIHdhaXRpbmcgZm9yIGEgc2xvdCBvbiBHUFU8YnI+CiBFWEVD
VVRFID0gcmVxdWVzdHMgd2FpdGluZyBvbiBmZW5jZXMgYW5kIGRlcGVuZGVuY2llcyBiZWZv
cmUgdGhleSBhcmUgcnVubmFibGU8YnI+CiBDVFhTQVZFID0gR1BVIHNhdmluZyB0aGUgY29u
dGV4dCBpbWFnZTxicj4KK0lOQ09NUExFVEUgPSByZXF1ZXN0IGhhcyBzdG9wcGVkIGV4ZWN1
dGluZyBidXQgaXMgbm90IHlldCBjb21wbGV0ZSAoZS5nLiBpdCB3YXMgcHJlLWVtcHRlZCkK
IDwvc21hbGw+CiA8L3A+CiA8cD4KQEAgLTk3NCw5ICs5ODQsMTEgQEAgc3ViIGJveF9zdHls
ZQogewogCW15ICgkY3R4LCAkc3RhZ2UpID0gQF87CiAJbXkgJGRlZzsKKwlteSAkdGV4dF9j
b2wgPSAnd2hpdGUnOwogCiAJaWYgKCRzdGFnZSBlcSAncXVldWUnKSB7CiAJCSRkZWcgPSA5
MDsKKwkJJHRleHRfY29sID0gJ2JsYWNrJyBpZiAkY29sb3VyX2NvbnRleHRzOwogCX0gZWxz
aWYgKCRzdGFnZSBlcSAncmVhZHknKSB7CiAJCSRkZWcgPSA0NTsKIAl9IGVsc2lmICgkc3Rh
Z2UgZXEgJ2V4ZWN1dGUnKSB7CkBAIC05ODcsNyArOTk5LDcgQEAgc3ViIGJveF9zdHlsZQog
CQkkZGVnID0gMDsKIAl9CiAKLQlyZXR1cm4gJ2NvbG9yOiBibGFjazsgYmFja2dyb3VuZDog
cmVwZWF0aW5nLWxpbmVhci1ncmFkaWVudCgnIC4KKwlyZXR1cm4gImNvbG9yOiAkdGV4dF9j
b2w7IGJhY2tncm91bmQ6IHJlcGVhdGluZy1saW5lYXItZ3JhZGllbnQoIiAuCiAJCSRkZWcg
LiAnZGVnLCAnIC4KIAkJY3R4X2NvbG91cigkY3R4LCAkc3RhZ2UsIDEuMCkgLiAnLCAnIC4K
IAkJY3R4X2NvbG91cigkY3R4LCAkc3RhZ2UsIDEuMCkgLiAnIDEwcHgsICcgLgotLSAKMi4x
Ni4xCgo=
--------------72B610CBC276117C0582EF60
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--------------72B610CBC276117C0582EF60--
