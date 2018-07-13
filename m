Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180712105958.12953-1-tvrtko.ursulin@linux.intel.com>
 <20180712105958.12953-3-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <ca64b1e1-5a86-119d-aca2-fdb45fb5d6d7@Intel.com>
Date: Thu, 12 Jul 2018 17:21:20 -0700
MIME-Version: 1.0
In-Reply-To: <20180712105958.12953-3-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/9] trace.pl: Scale timeline for better
 precision
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0134723352=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0134723352==
Content-Type: multipart/alternative;
 boundary="------------1A8C9151517517833632E3E9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1A8C9151517517833632E3E9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> vis library has a limited precision compared to our trace data which
> prevents zooming into the timeline and seeing the fine detail.
>
> Scale the HTML view by a thousand to work around it.
>
> v2: Rebase for time axis changes.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Reviewed-by: John Harrison <John.C.Harrison@Intel.com> # v1
> ---
>   scripts/trace.pl | 46 +++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 43 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/trace.pl b/scripts/trace.pl
> index 89491125490d..726c90d44547 100755
> --- a/scripts/trace.pl
> +++ b/scripts/trace.pl
> @@ -40,6 +40,7 @@ my $trace = 0;
>   my $avg_delay_stats = 0;
>   my $gpu_timeline = 0;
>   my $colour_contexts = 0;
> +my $no_timeline_scaling = 0;
>   
>   my @args;
>   
> @@ -281,6 +282,18 @@ sub arg_colour_contexts
>   	return @_;
>   }
>   
> +sub arg_no_timeline_scaling
> +{
> +	return unless scalar(@_);
> +
> +	if ($_[0] eq '--no-timeline-scaling') {
> +		shift @_;
> +		$no_timeline_scaling = 1;
> +	}
> +
> +	return @_;
> +}
> +
>   @args = @ARGV;
>   while (@args) {
>   	my $left = scalar(@args);
> @@ -296,6 +309,7 @@ while (@args) {
>   	@args = arg_ignore_ring(@args);
>   	@args = arg_skip_box(@args);
>   	@args = arg_colour_contexts(@args);
> +	@args = arg_no_timeline_scaling(@args);
>   
>   	last if $left == scalar(@args);
>   }
> @@ -334,6 +348,8 @@ sub ts
>   	my ($us) = @_;
>   	my ($y, $mo, $d, $h, $m, $s);
>   
> +	$us *= 1000 unless $no_timeline_scaling;
> +
>   	$s = int($us / 1000000);
>   	$us = $us % 1000000;
>   
> @@ -1001,11 +1017,28 @@ print <<ENDHTML;
>     ]);
>   
>     var last_major_ms;
> +ENDHTML
> +
> +if ($html) {
> +	if ($no_timeline_scaling) {
> +		say "  timeDiv = 1;";
> +	} else {
> +		say "  timeDiv = 1000;";
> +	}
> +}
>   
> +print <<ENDHTML;
>     function majorAxis(date, scale, step) {
> -	var s = date / 1000;
> +	var s = date / 1000 / timeDiv;
> +
> +	last_major_ms = date / timeDiv;
>   
> -	last_major_ms = date;
> +	if (timeDiv == 1000) {
> +		if (scale == 'second')
> +			scale = 'millisecond';
> +		else if (scale == 'minute')
> +			scale = 'second'
> +	}
>   
>   	if (scale == 'millisecond')
>   		return s.toFixed(6) + "s";
> @@ -1016,13 +1049,20 @@ print <<ENDHTML;
>     }
>   
>     function minorAxis(date, scale, step) {
> -	var ms = date;
> +	var ms = date / timeDiv;
>   
>   	ms -= last_major_ms;
>   
>   	if (ms < 0)
>   		return '';
>   
> +	if (timeDiv > 1) {
> +		if (scale == 'second')
> +			scale = 'millisecond';
> +		else if (scale == 'minute')
> +			scale = 'second';
> +	}
> +
>   	if (scale == 'millisecond')
>   		return "+" + ms.toFixed(3) + "ms";
>   	else if (scale == 'second')

Reviewed-by: John Harrison<John.C.Harrison@Intel.com>  


--------------1A8C9151517517833632E3E9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180712105958.12953-3-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

vis library has a limited precision compared to our trace data which
prevents zooming into the timeline and seeing the fine detail.

Scale the HTML view by a thousand to work around it.

v2: Rebase for time axis changes.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Suggested-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a> # v1
---
 scripts/trace.pl | 46 +++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 43 insertions(+), 3 deletions(-)

diff --git a/scripts/trace.pl b/scripts/trace.pl
index 89491125490d..726c90d44547 100755
--- a/scripts/trace.pl
+++ b/scripts/trace.pl
@@ -40,6 +40,7 @@ my $trace = 0;
 my $avg_delay_stats = 0;
 my $gpu_timeline = 0;
 my $colour_contexts = 0;
+my $no_timeline_scaling = 0;
 
 my @args;
 
@@ -281,6 +282,18 @@ sub arg_colour_contexts
 	return @_;
 }
 
+sub arg_no_timeline_scaling
+{
+	return unless scalar(@_);
+
+	if ($_[0] eq '--no-timeline-scaling') {
+		shift @_;
+		$no_timeline_scaling = 1;
+	}
+
+	return @_;
+}
+
 @args = @ARGV;
 while (@args) {
 	my $left = scalar(@args);
@@ -296,6 +309,7 @@ while (@args) {
 	@args = arg_ignore_ring(@args);
 	@args = arg_skip_box(@args);
 	@args = arg_colour_contexts(@args);
+	@args = arg_no_timeline_scaling(@args);
 
 	last if $left == scalar(@args);
 }
@@ -334,6 +348,8 @@ sub ts
 	my ($us) = @_;
 	my ($y, $mo, $d, $h, $m, $s);
 
+	$us *= 1000 unless $no_timeline_scaling;
+
 	$s = int($us / 1000000);
 	$us = $us % 1000000;
 
@@ -1001,11 +1017,28 @@ print &lt;&lt;ENDHTML;
   ]);
 
   var last_major_ms;
+ENDHTML
+
+if ($html) {
+	if ($no_timeline_scaling) {
+		say "  timeDiv = 1;";
+	} else {
+		say "  timeDiv = 1000;";
+	}
+}
 
+print &lt;&lt;ENDHTML;
   function majorAxis(date, scale, step) {
-	var s = date / 1000;
+	var s = date / 1000 / timeDiv;
+
+	last_major_ms = date / timeDiv;
 
-	last_major_ms = date;
+	if (timeDiv == 1000) {
+		if (scale == 'second')
+			scale = 'millisecond';
+		else if (scale == 'minute')
+			scale = 'second'
+	}
 
 	if (scale == 'millisecond')
 		return s.toFixed(6) + "s";
@@ -1016,13 +1049,20 @@ print &lt;&lt;ENDHTML;
   }
 
   function minorAxis(date, scale, step) {
-	var ms = date;
+	var ms = date / timeDiv;
 
 	ms -= last_major_ms;
 
 	if (ms &lt; 0)
 		return '';
 
+	if (timeDiv &gt; 1) {
+		if (scale == 'second')
+			scale = 'millisecond';
+		else if (scale == 'minute')
+			scale = 'second';
+	}
+
 	if (scale == 'millisecond')
 		return "+" + ms.toFixed(3) + "ms";
 	else if (scale == 'second')
</pre>
    </blockquote>
    <br>
    <pre wrap="">Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a> 

</pre>
  </body>
</html>

--------------1A8C9151517517833632E3E9--

--===============0134723352==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0134723352==--
