Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <af34c9a1-b6d6-5d14-9f5d-c8ac90475479@Intel.com>
 <20180716084947.7585-1-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <cf95b315-d3d3-0bd6-05f8-ea74a0960c74@Intel.com>
Date: Mon, 16 Jul 2018 12:11:51 -0700
MIME-Version: 1.0
In-Reply-To: <20180716084947.7585-1-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v4 5/9] trace.pl: Improved key/colours
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0539394390=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0539394390==
Content-Type: multipart/alternative;
 boundary="------------5B8EA8DACE2C95134A544892"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5B8EA8DACE2C95134A544892
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/2018 1:49 AM, Tvrtko Ursulin wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> Improve the timeline legend to show actual context colours.
>
> v2: (Tvrtko Ursulin)
>   * Commit msg.
>   * Tweak layout for more compactness and more readability.
>
> v3:
>   * Limit number of shown contexts in the legend. (John Harrison)
>
> v4:
>   * Unbreak legend display with small context counts. (John Harrison)
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   scripts/trace.pl | 82 +++++++++++++++++++++++++++++++++---------------
>   1 file changed, 56 insertions(+), 26 deletions(-)
>
> diff --git a/scripts/trace.pl b/scripts/trace.pl
> index bad5414e11d6..43b5fadc3a21 100755
> --- a/scripts/trace.pl
> +++ b/scripts/trace.pl
> @@ -738,9 +738,48 @@ say sprintf('GPU: %.2f%% idle, %.2f%% busy',
>   	     $flat_busy{'gpu-idle'}, $flat_busy{'gpu-busy'}) unless $html;
>   
>   my $timeline_text = $colour_contexts ?
> -		    'Per context coloured shading like:' : 'Box shading like:';
> +		    'per context coloured shading like' : 'box shading like';
>   
>   my %ctx_colours;
> +my $ctx_table;
> +
> +sub generate_ctx_table
> +{
> +	my @states = ('queue', 'ready', 'execute', 'ctxsave', 'incomplete');
> +	my $max_show = 6;
> +	my (@ctxts, @disp_ctxts);
> +	my $step;
> +
> +	if( $colour_contexts ) {
> +		@ctxts = sort keys %ctxdb;
> +	} else {
> +		@ctxts = ($min_ctx);
> +	}
> +
> +	# Limit number of shown context examples
> +	$step = int(scalar(@ctxts) / $max_show);
> +	if ($step) {
> +		foreach my $i (0..$#ctxts) {
> +			push @disp_ctxts, $ctxts[$i] unless $i % $step;
> +			last if scalar(@disp_ctxts) == $max_show;
> +		}
> +	} else {
> +		@disp_ctxts = @ctxts;
> +	}
> +
> +	$ctx_table .= '<table>';
> +
> +	foreach my $ctx (@disp_ctxts) {
> +		$ctx_table .= "<tr>\n";
> +		$ctx_table .= "  <td>Context $ctx</td>\n" if $colour_contexts;
> +		foreach my $state (@states) {
> +			$ctx_table .= "  <td align='center' valign='middle'><div style='" . box_style($ctx, $state) . " padding-top: 6px; padding-bottom: 6px; padding-left: 6x; padding-right: 6px;'>" . uc($state) . "</div></td>\n";
> +		}
> +		$ctx_table .= "</tr>\n";
> +	}
> +
> +	$ctx_table .= '</table>';
> +}
>   
>   sub generate_ctx_colours
>   {
> @@ -754,12 +793,7 @@ sub generate_ctx_colours
>   
>   
>   generate_ctx_colours() if $html and $colour_contexts;
> -
> -my $queued_style = box_style($min_ctx, 'queue');
> -my $ready_style = box_style($min_ctx, 'ready');
> -my $execute_style = box_style($min_ctx, 'execute');
> -my $ctxsave_style = box_style($min_ctx, 'ctxsave');
> -my $incomplete_style = box_style($min_ctx, 'incomplete');
> +generate_ctx_table() if $html;
>   
>   print <<ENDHTML if $html;
>   <!DOCTYPE HTML>
> @@ -778,35 +812,27 @@ print <<ENDHTML if $html;
>   </head>
>   <body>
>   <p>
> -<b>Timeline request view:</b>
> +<b>Timeline request view is $timeline_text:</b>
>   <table>
> -<tr><td colspan='4'>$timeline_text</td></tr>
>   <tr>
> -<td align='center'><div style='$queued_style'>QUEUED</div></td>
> -<td align='center'><div style='$ready_style'>READY</div></td>
> -<td align='center'><div style='$execute_style'>EXECUTE</div></td>
> -<td align='center'><div style='$ctxsave_style'>CTXSAVE</div></td>
> -</tr><tr>
> -<td></td>
> -<td></td>
> -<td align='center'><div style='$incomplete_style'>(INCOMPLETE)</div></td>
> -<td></td>
> -</tr/></table>
> -</p>
> -<p>
> -<small>
> -QUEUED = requests executing on the GPU<br>
> +<td>
> +$ctx_table
> +</td>
> +<td>
> +QUEUE = requests executing on the GPU<br>
>   READY = runnable requests waiting for a slot on GPU<br>
>   EXECUTE = requests waiting on fences and dependencies before they are runnable<br>
>   CTXSAVE = GPU saving the context image<br>
> -</small>
> -</p>
> +INCOMPLETE = request of unknown completion time
>   <p>
>   Boxes are in format 'ctx-id/seqno'.
>   </p>
>   <p>
>   Use Ctrl+scroll-action to zoom-in/out and scroll-action or dragging to move around the timeline.
>   </p>
> +</td>
> +</tr>
> +</table>
>   <p>
>   <b>GPU idle: $flat_busy{'gpu-idle'}%</b>
>   <br>
> @@ -975,20 +1001,24 @@ sub box_style
>   {
>   	my ($ctx, $stage) = @_;
>   	my $deg;
> +	my $text_col = 'white';
>   
>   	if ($stage eq 'queue') {
>   		$deg = 90;
> +		$text_col = 'black' if $colour_contexts;
>   	} elsif ($stage eq 'ready') {
>   		$deg = 45;
>   	} elsif ($stage eq 'execute') {
>   		$deg = 0;
> +		$text_col = 'black' if $colour_contexts;
>   	} elsif ($stage eq 'ctxsave') {
>   		$deg = 105;
> +		$text_col = 'black' if $colour_contexts;
>   	} elsif ($stage eq 'incomplete') {
>   		$deg = 0;
>   	}
>   
> -	return 'color: black; background: repeating-linear-gradient(' .
> +	return "color: $text_col; background: repeating-linear-gradient(" .
>   		$deg . 'deg, ' .
>   		ctx_colour($ctx, $stage, 1.0) . ', ' .
>   		ctx_colour($ctx, $stage, 1.0) . ' 10px, ' .

Reviewed-by: John Harrison<John.C.Harrison@Intel.com>


--------------5B8EA8DACE2C95134A544892
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/16/2018 1:49 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180716084947.7585-1-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

Improve the timeline legend to show actual context colours.

v2: (Tvrtko Ursulin)
 * Commit msg.
 * Tweak layout for more compactness and more readability.

v3:
 * Limit number of shown contexts in the legend. (John Harrison)

v4:
 * Unbreak legend display with small context counts. (John Harrison)

Signed-off-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
Cc: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
---
 scripts/trace.pl | 82 +++++++++++++++++++++++++++++++++---------------
 1 file changed, 56 insertions(+), 26 deletions(-)

diff --git a/scripts/trace.pl b/scripts/trace.pl
index bad5414e11d6..43b5fadc3a21 100755
--- a/scripts/trace.pl
+++ b/scripts/trace.pl
@@ -738,9 +738,48 @@ say sprintf('GPU: %.2f%% idle, %.2f%% busy',
 	     $flat_busy{'gpu-idle'}, $flat_busy{'gpu-busy'}) unless $html;
 
 my $timeline_text = $colour_contexts ?
-		    'Per context coloured shading like:' : 'Box shading like:';
+		    'per context coloured shading like' : 'box shading like';
 
 my %ctx_colours;
+my $ctx_table;
+
+sub generate_ctx_table
+{
+	my @states = ('queue', 'ready', 'execute', 'ctxsave', 'incomplete');
+	my $max_show = 6;
+	my (@ctxts, @disp_ctxts);
+	my $step;
+
+	if( $colour_contexts ) {
+		@ctxts = sort keys %ctxdb;
+	} else {
+		@ctxts = ($min_ctx);
+	}
+
+	# Limit number of shown context examples
+	$step = int(scalar(@ctxts) / $max_show);
+	if ($step) {
+		foreach my $i (0..$#ctxts) {
+			push @disp_ctxts, $ctxts[$i] unless $i % $step;
+			last if scalar(@disp_ctxts) == $max_show;
+		}
+	} else {
+		@disp_ctxts = @ctxts;
+	}
+
+	$ctx_table .= '&lt;table&gt;';
+
+	foreach my $ctx (@disp_ctxts) {
+		$ctx_table .= "&lt;tr&gt;\n";
+		$ctx_table .= "  &lt;td&gt;Context $ctx&lt;/td&gt;\n" if $colour_contexts;
+		foreach my $state (@states) {
+			$ctx_table .= "  &lt;td align='center' valign='middle'&gt;&lt;div style='" . box_style($ctx, $state) . " padding-top: 6px; padding-bottom: 6px; padding-left: 6x; padding-right: 6px;'&gt;" . uc($state) . "&lt;/div&gt;&lt;/td&gt;\n";
+		}
+		$ctx_table .= "&lt;/tr&gt;\n";
+	}
+
+	$ctx_table .= '&lt;/table&gt;';
+}
 
 sub generate_ctx_colours
 {
@@ -754,12 +793,7 @@ sub generate_ctx_colours
 
 
 generate_ctx_colours() if $html and $colour_contexts;
-
-my $queued_style = box_style($min_ctx, 'queue');
-my $ready_style = box_style($min_ctx, 'ready');
-my $execute_style = box_style($min_ctx, 'execute');
-my $ctxsave_style = box_style($min_ctx, 'ctxsave');
-my $incomplete_style = box_style($min_ctx, 'incomplete');
+generate_ctx_table() if $html;
 
 print &lt;&lt;ENDHTML if $html;
 &lt;!DOCTYPE HTML&gt;
@@ -778,35 +812,27 @@ print &lt;&lt;ENDHTML if $html;
 &lt;/head&gt;
 &lt;body&gt;
 &lt;p&gt;
-&lt;b&gt;Timeline request view:&lt;/b&gt;
+&lt;b&gt;Timeline request view is $timeline_text:&lt;/b&gt;
 &lt;table&gt;
-&lt;tr&gt;&lt;td colspan='4'&gt;$timeline_text&lt;/td&gt;&lt;/tr&gt;
 &lt;tr&gt;
-&lt;td align='center'&gt;&lt;div style='$queued_style'&gt;QUEUED&lt;/div&gt;&lt;/td&gt;
-&lt;td align='center'&gt;&lt;div style='$ready_style'&gt;READY&lt;/div&gt;&lt;/td&gt;
-&lt;td align='center'&gt;&lt;div style='$execute_style'&gt;EXECUTE&lt;/div&gt;&lt;/td&gt;
-&lt;td align='center'&gt;&lt;div style='$ctxsave_style'&gt;CTXSAVE&lt;/div&gt;&lt;/td&gt;
-&lt;/tr&gt;&lt;tr&gt;
-&lt;td&gt;&lt;/td&gt;
-&lt;td&gt;&lt;/td&gt;
-&lt;td align='center'&gt;&lt;div style='$incomplete_style'&gt;(INCOMPLETE)&lt;/div&gt;&lt;/td&gt;
-&lt;td&gt;&lt;/td&gt;
-&lt;/tr/&gt;&lt;/table&gt;
-&lt;/p&gt;
-&lt;p&gt;
-&lt;small&gt;
-QUEUED = requests executing on the GPU&lt;br&gt;
+&lt;td&gt;
+$ctx_table
+&lt;/td&gt;
+&lt;td&gt;
+QUEUE = requests executing on the GPU&lt;br&gt;
 READY = runnable requests waiting for a slot on GPU&lt;br&gt;
 EXECUTE = requests waiting on fences and dependencies before they are runnable&lt;br&gt;
 CTXSAVE = GPU saving the context image&lt;br&gt;
-&lt;/small&gt;
-&lt;/p&gt;
+INCOMPLETE = request of unknown completion time
 &lt;p&gt;
 Boxes are in format 'ctx-id/seqno'.
 &lt;/p&gt;
 &lt;p&gt;
 Use Ctrl+scroll-action to zoom-in/out and scroll-action or dragging to move around the timeline.
 &lt;/p&gt;
+&lt;/td&gt;
+&lt;/tr&gt;
+&lt;/table&gt;
 &lt;p&gt;
 &lt;b&gt;GPU idle: $flat_busy{'gpu-idle'}%&lt;/b&gt;
 &lt;br&gt;
@@ -975,20 +1001,24 @@ sub box_style
 {
 	my ($ctx, $stage) = @_;
 	my $deg;
+	my $text_col = 'white';
 
 	if ($stage eq 'queue') {
 		$deg = 90;
+		$text_col = 'black' if $colour_contexts;
 	} elsif ($stage eq 'ready') {
 		$deg = 45;
 	} elsif ($stage eq 'execute') {
 		$deg = 0;
+		$text_col = 'black' if $colour_contexts;
 	} elsif ($stage eq 'ctxsave') {
 		$deg = 105;
+		$text_col = 'black' if $colour_contexts;
 	} elsif ($stage eq 'incomplete') {
 		$deg = 0;
 	}
 
-	return 'color: black; background: repeating-linear-gradient(' .
+	return "color: $text_col; background: repeating-linear-gradient(" .
 		$deg . 'deg, ' .
 		ctx_colour($ctx, $stage, 1.0) . ', ' .
 		ctx_colour($ctx, $stage, 1.0) . ' 10px, ' .
</pre>
    </blockquote>
    <br>
    <pre wrap="">Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

</pre>
  </body>
</html>

--------------5B8EA8DACE2C95134A544892--

--===============0539394390==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0539394390==--
