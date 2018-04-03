Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25896E5BB
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Apr 2018 21:06:52 +0000 (UTC)
References: <20180330195625.22529-1-scott.d.phillips@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <a490872c-5d34-2784-8db2-5c9471f5dcef@intel.com>
Date: Tue, 3 Apr 2018 22:06:50 +0100
MIME-Version: 1.0
In-Reply-To: <20180330195625.22529-1-scott.d.phillips@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tools/aubdump: dump 48-bit addresses
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0336028553=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Scott D Phillips <scott.d.phillips@intel.com>, igt-dev@lists.freedesktop.org, Jordan Justen <jordan.l.justen@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0336028553==
Content-Type: multipart/alternative;
 boundary="------------53FB7B8AA8BA76D57605C77C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------53FB7B8AA8BA76D57605C77C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/03/18 20:56, Scott D Phillips wrote:
> For gen10+, write out PPGTT tables in aub files so that full
> 48-bit addresses can be serialized.
>
> Signed-off-by: Scott D Phillips<scott.d.phillips@intel.com>
> Cc: Jordan Justen<jordan.l.justen@intel.com>
Struggled a bit with the page table stuff, otherwise looks good to me :

Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>

--------------53FB7B8AA8BA76D57605C77C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 30/03/18 20:56, Scott D Phillips
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180330195625.22529-1-scott.d.phillips@intel.com">
      <pre wrap="">For gen10+, write out PPGTT tables in aub files so that full
48-bit addresses can be serialized.

Signed-off-by: Scott D Phillips <a class="moz-txt-link-rfc2396E" href="mailto:scott.d.phillips@intel.com" moz-do-not-send="true">&lt;scott.d.phillips@intel.com&gt;</a>
Cc: Jordan Justen <a class="moz-txt-link-rfc2396E" href="mailto:jordan.l.justen@intel.com" moz-do-not-send="true">&lt;jordan.l.justen@intel.com&gt;</a></pre>
    </blockquote>
    Struggled a bit with the page table stuff, otherwise looks good to
    me :<br>
    <br>
    Reviewed-by: Lionel Landwerlin <a class="moz-txt-link-rfc2396E" href="mailto:lionel.g.landwerlin@intel.com">&lt;lionel.g.landwerlin@intel.com&gt;</a><br>
  </body>
</html>

--------------53FB7B8AA8BA76D57605C77C--

--===============0336028553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0336028553==--
