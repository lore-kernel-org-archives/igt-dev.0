Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18BA76E446
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2019 09:34:48 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue, 3 Dec 2019 11:34:32 +0200
Message-ID: <20191203093433.170060-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] .gitlab-ci/skopeo: Provide credentials
 on the cmd line
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

TmV3ZXIgdmVyc2lvbiBvZiBza29wZW8gc2VlbXMgdG8gYmUgYnJva2VuIHdoZW4gaXQgY29tZXMg
dG8gdXNpbmcgdGhlCmNyZWRlbnRpYWxzIGZpbGUuIExldCdzIHdvcmthcm91bmQgdGhpcyBieSBw
cm92aWRpbmcgdGhlbSBvbiB0aGUgY21kCmxpbmUuCgpTaWduZWQtb2ZmLWJ5OiBBcmthZGl1c3og
SGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0tLQogLmdpdGxhYi1jaS9wdWxsLW9y
LXJlYnVpbGQuc2ggfCA2ICsrKystLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS8uZ2l0bGFiLWNpL3B1bGwtb3ItcmVidWlsZC5z
aCBiLy5naXRsYWItY2kvcHVsbC1vci1yZWJ1aWxkLnNoCmluZGV4IGE5NDA5ZGI4Li40Zjc3NDMx
YiAxMDA3NTUKLS0tIGEvLmdpdGxhYi1jaS9wdWxsLW9yLXJlYnVpbGQuc2gKKysrIGIvLmdpdGxh
Yi1jaS9wdWxsLW9yLXJlYnVpbGQuc2gKQEAgLTUwLDE0ICs1MCwxNiBAQCBpZiBbICIkVFlQRSIg
PSAiYmFzZSIgXTsgdGhlbgogCQlwb2RtYW4gcHVzaCAkRE9DS0VSTkFNRQogCWZpCiAKLQlza29w
ZW8gY29weSBkb2NrZXI6Ly8kRE9DS0VSTkFNRSBkb2NrZXI6Ly8kQ09NTUlUTkFNRQorCXNrb3Bl
byBjb3B5IC0tZGVzdC1jcmVkcyAkQ0lfUkVHSVNUUllfVVNFUjokQ0lfUkVHSVNUUllfUEFTU1dP
UkQgXAorICAgICAgICAgICAgICAgZG9ja2VyOi8vJERPQ0tFUk5BTUUgZG9ja2VyOi8vJENPTU1J
VE5BTUUKIGVsaWYgWyAiJFRZUEUiID0gImlndCIgXTsgdGhlbgogCSMgY29udGFpbmVyIHdpdGgg
SUdULCB3ZSBkb24ndCBjYXJlIGFib3V0IERvY2tlcmZpbGUgY2hhbmdlcwogCSMgd2UgYWx3YXlz
IHJlYnVpbGQKIAlzZXQgLWUKIAkkUE9ETUFOX0JVSUxEIC10ICRDT01NSVROQU1FIC1mICRET0NL
RVJGSUxFIC4KIAlwb2RtYW4gcHVzaCAkQ09NTUlUTkFNRQotCXNrb3BlbyBjb3B5IGRvY2tlcjov
LyRDT01NSVROQU1FIGRvY2tlcjovLyRSRUZOQU1FCisJc2tvcGVvIGNvcHkgLS1kZXN0LWNyZWRz
ICRDSV9SRUdJU1RSWV9VU0VSOiRDSV9SRUdJU1RSWV9QQVNTV09SRCBcCisgICAgICAgICAgICAg
ICBkb2NrZXI6Ly8kQ09NTUlUTkFNRSBkb2NrZXI6Ly8kUkVGTkFNRQogZWxzZQogCWVjaG8gInVu
a25vd24gYnVpbGQgdHlwZSAkVFlQRSIKIAlleGl0IDEKLS0gCjIuMjMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
