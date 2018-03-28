Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180328182948.27494-1-tvrtko.ursulin@linux.intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <9e8af992-2edf-6d79-1cb5-1b64e95fea17@intel.com>
Date: Wed, 28 Mar 2018 19:56:41 +0100
MIME-Version: 1.0
In-Reply-To: <20180328182948.27494-1-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [RFC i-g-t] intel-gpu-top: Rewrite the tool to be
 safe to use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1800405733=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1800405733==
Content-Type: multipart/alternative;
 boundary="------------C72E59B823207781AF374560"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C72E59B823207781AF374560
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/03/18 19:29, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
>
> intel-gpu-top is a dangerous tool which can hang machines due unsafe mmio
> register access. This patch rewrites it to use only PMU.
>
> Only overall command streamer busyness and GPU global data such as power
> and frequencies are included in this new version.
>
> For access to more GPU functional unit level data, an OA metric based tool
> like gpu-top should be used instead.
>
> Signed-off-by: Tvrtko Ursulin<tvrtko.ursulin@intel.com>
> Cc: Chris Wilson<chris@chris-wilson.co.uk>
> Cc: Lionel Landwerlin<lionel.g.landwerlin@intel.com>
> Cc: Petri Latvala<petri.latvala@intel.com>

Looks good to me too. Sorry, this isn't a detailed review, but since 
it's a lot safer :

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

--------------C72E59B823207781AF374560
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 28/03/18 19:29, Tvrtko Ursulin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180328182948.27494-1-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com" moz-do-not-send="true">&lt;tvrtko.ursulin@intel.com&gt;</a>

intel-gpu-top is a dangerous tool which can hang machines due unsafe mmio
register access. This patch rewrites it to use only PMU.

Only overall command streamer busyness and GPU global data such as power
and frequencies are included in this new version.

For access to more GPU functional unit level data, an OA metric based tool
like gpu-top should be used instead.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com" moz-do-not-send="true">&lt;tvrtko.ursulin@intel.com&gt;</a>
Cc: Chris Wilson <a class="moz-txt-link-rfc2396E" href="mailto:chris@chris-wilson.co.uk" moz-do-not-send="true">&lt;chris@chris-wilson.co.uk&gt;</a>
Cc: Lionel Landwerlin <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com" moz-do-not-send="true">&lt;lionel.g.landwerlin@intel.com&gt;</a>
Cc: Petri Latvala <a class="moz-txt-link-rfc2396E" href="mailto:petri.latvala@intel.com" moz-do-not-send="true">&lt;petri.latvala@intel.com&gt;</a>
</pre>
    </blockquote>
    <br>
    Looks good to me too. Sorry, this isn't a detailed review, but since
    it's a lot safer :<br>
    <br>
    Reviewed-by: Lionel Landwerlin <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
  </body>
</html>

--------------C72E59B823207781AF374560--

--===============1800405733==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1800405733==--
