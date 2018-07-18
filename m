Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180718094514.5903-1-tvrtko.ursulin@linux.intel.com>
 <20180718094514.5903-8-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <e2776feb-7eb8-ad55-850b-ffdcbb41363a@Intel.com>
Date: Wed, 18 Jul 2018 13:13:12 -0700
MIME-Version: 1.0
In-Reply-To: <20180718094514.5903-8-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] trace.pl: Basic preemption support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0072414376=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0072414376==
Content-Type: multipart/alternative;
 boundary="------------D61587B5B24B55D0A85AC99D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D61587B5B24B55D0A85AC99D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/18/2018 2:45 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Just forget about earlier request_in events.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   scripts/trace.pl | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/trace.pl b/scripts/trace.pl
> index 60d42865acbd..41bedeefb776 100755
> --- a/scripts/trace.pl
> +++ b/scripts/trace.pl
> @@ -408,7 +408,9 @@ while (<>) {
>   	} elsif ($tp_name eq 'i915:i915_request_in:') {
>   		my %req;
>   
> -		die if exists $db{$key};
> +		# preemption
> +		delete $db{$key} if exists $db{$key};
> +
>   		die unless exists $queue{$key};
>   		die unless exists $submit{$key};
>   

I've definitely r-b'd this one before too. And no changes so still...

Reviewed-by: John Harrison<John.C.Harrison@Intel.com>


--------------D61587B5B24B55D0A85AC99D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/18/2018 2:45 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180718094514.5903-8-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

Just forget about earlier request_in events.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
---
 scripts/trace.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/trace.pl b/scripts/trace.pl
index 60d42865acbd..41bedeefb776 100755
--- a/scripts/trace.pl
+++ b/scripts/trace.pl
@@ -408,7 +408,9 @@ while (&lt;&gt;) {
 	} elsif ($tp_name eq 'i915:i915_request_in:') {
 		my %req;
 
-		die if exists $db{$key};
+		# preemption
+		delete $db{$key} if exists $db{$key};
+
 		die unless exists $queue{$key};
 		die unless exists $submit{$key};
 
</pre>
    </blockquote>
    <br>
    I've definitely r-b'd this one before too. And no changes so
    still...<br>
    <pre wrap="">Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

</pre>
  </body>
</html>

--------------D61587B5B24B55D0A85AC99D--

--===============0072414376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0072414376==--
