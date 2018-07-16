Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <7d8a4756-c021-2751-f81c-0e67b2eba076@Intel.com>
 <20180713095537.21080-1-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <98e2bb4d-b037-af25-90ed-ef54f5033381@Intel.com>
Date: Mon, 16 Jul 2018 10:53:16 -0700
MIME-Version: 1.0
In-Reply-To: <20180713095537.21080-1-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t v2 1/9] trace.pl: Improve time axis
 labels
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0076697940=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0076697940==
Content-Type: multipart/alternative;
 boundary="------------527EC73FF70D9E4D1141705E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------527EC73FF70D9E4D1141705E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/13/2018 2:55 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> It is possible to customize the axis display so change it to display
> timestamps in seconds on the major axis (with six decimal spaces) and
> millisecond offsets on the minor axis.
>
> v2:
>   * Give up on broken relative timestamps.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   scripts/trace.pl | 37 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 37 insertions(+)
>
> diff --git a/scripts/trace.pl b/scripts/trace.pl
> index fc1713e4f9a7..41f10749a153 100755
> --- a/scripts/trace.pl
> +++ b/scripts/trace.pl
> @@ -1000,6 +1000,42 @@ $first_ts = ts($first_ts);
>   print <<ENDHTML;
>     ]);
>   
> +  function majorAxis(date, scale, step) {
> +	var s = date / 1000;
> +	var precision;
> +
> +	if (scale == 'millisecond')
> +		precision = 6;
> +	else if (scale == 'second')
> +		precision = 3;
> +	else
> +		precision = 0;
> +
> +	return s.toFixed(precision) + "s";
> +  }
> +
> +  function minorAxis(date, scale, step) {
> +	var ms = date;
> +	var precision;
> +	var unit;
> +
> +	if (scale == 'millisecond') {
> +		ms %= 1000;
> +		precision = 0;
> +		unit = 'ms';
> +	} else if (scale == 'second') {
> +		ms /= 1000;
> +		precision = 1;
> +		unit = 's';
> +	} else {
> +		ms /= 1000;
> +		precision = 0;
> +		unit = 's';
> +	}
> +
> +	return ms.toFixed(precision) + unit;
> +  }
> +
>     // Configuration for the Timeline
>     var options = { groupOrder: 'content',
>   		  horizontalScroll: true,
> @@ -1007,6 +1043,7 @@ print <<ENDHTML;
>   		  stackSubgroups: false,
>   		  zoomKey: 'ctrlKey',
>   		  orientation: 'top',
> +		  format: { majorLabels: majorAxis, minorLabels: minorAxis },
>   		  start: '$first_ts',
>   		  end: '$end_ts'};
>   

I'm still seeing some kind of strange offset. However, it appears to be 
browser dependent. If I use Chrome then the offset is +28.8 seconds. 
With Firefox it is -59958115.2 seconds! On the other hand, if I try Edge 
or IE then I don't get a graph at all. I'm wondering if the issue is 
with Vis browser compatibility rather than anything in the trace.pl 
script. Are you seeing anything at all similar?

Hmm, if I comment out the 'format:' line and go back to the unformatted 
time stamps then IE & Edge still show nothing. However, Firefox shows 
dates based on a year of 0097 whereas Chrome says 1997.

Either way, I can't spot anything in this patch that could cause a 
random offset. So...

Reviewed-by: John Harrison<John.C.Harrison@Intel.com>




--------------527EC73FF70D9E4D1141705E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/13/2018 2:55 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180713095537.21080-1-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

It is possible to customize the axis display so change it to display
timestamps in seconds on the major axis (with six decimal spaces) and
millisecond offsets on the minor axis.

v2:
 * Give up on broken relative timestamps.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Suggested-by: Chris Wilson <a class="moz-txt-link-rfc2396E" href="mailto:chris@chris-wilson.co.uk">&lt;chris@chris-wilson.co.uk&gt;</a>
Cc: Chris Wilson <a class="moz-txt-link-rfc2396E" href="mailto:chris@chris-wilson.co.uk">&lt;chris@chris-wilson.co.uk&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
---
 scripts/trace.pl | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/scripts/trace.pl b/scripts/trace.pl
index fc1713e4f9a7..41f10749a153 100755
--- a/scripts/trace.pl
+++ b/scripts/trace.pl
@@ -1000,6 +1000,42 @@ $first_ts = ts($first_ts);
 print &lt;&lt;ENDHTML;
   ]);
 
+  function majorAxis(date, scale, step) {
+	var s = date / 1000;
+	var precision;
+
+	if (scale == 'millisecond')
+		precision = 6;
+	else if (scale == 'second')
+		precision = 3;
+	else
+		precision = 0;
+
+	return s.toFixed(precision) + "s";
+  }
+
+  function minorAxis(date, scale, step) {
+	var ms = date;
+	var precision;
+	var unit;
+
+	if (scale == 'millisecond') {
+		ms %= 1000;
+		precision = 0;
+		unit = 'ms';
+	} else if (scale == 'second') {
+		ms /= 1000;
+		precision = 1;
+		unit = 's';
+	} else {
+		ms /= 1000;
+		precision = 0;
+		unit = 's';
+	}
+
+	return ms.toFixed(precision) + unit;
+  }
+
   // Configuration for the Timeline
   var options = { groupOrder: 'content',
 		  horizontalScroll: true,
@@ -1007,6 +1043,7 @@ print &lt;&lt;ENDHTML;
 		  stackSubgroups: false,
 		  zoomKey: 'ctrlKey',
 		  orientation: 'top',
+		  format: { majorLabels: majorAxis, minorLabels: minorAxis },
 		  start: '$first_ts',
 		  end: '$end_ts'};
 
</pre>
    </blockquote>
    <br>
    I'm still seeing some kind of strange offset. However, it appears to
    be browser dependent. If I use Chrome then the offset is +28.8
    seconds. With Firefox it is -59958115.2 seconds! On the other hand,
    if I try Edge or IE then I don't get a graph at all. I'm wondering
    if the issue is with Vis browser compatibility rather than anything
    in the trace.pl script. Are you seeing anything at all similar?<br>
    <br>
    Hmm, if I comment out the 'format:' line and go back to the
    unformatted time stamps then IE &amp; Edge still show nothing.
    However, Firefox shows dates based on a year of 0097 whereas Chrome
    says 1997.<br>
    <br>
    Either way, I can't spot anything in this patch that could cause a
    random offset. So...<br>
    <pre wrap="">Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

</pre>
    <br>
    <br>
  </body>
</html>

--------------527EC73FF70D9E4D1141705E--

--===============0076697940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0076697940==--
