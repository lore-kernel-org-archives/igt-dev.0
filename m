Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Sat, 7 Jul 2018 20:23:17 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <bc432c62f79076f1c1a757d8e41035ed1e7d3100.1531005542.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1531005542.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1531005542.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 4/7] Fix truncate string in the snprintf
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
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, gustavo@padovan.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBmaXggdGhlIGZvbGxvd2luZyBHQ0Mgd2FybmluZzoKCmludGVsX3JlZy5jOiBJ
biBmdW5jdGlvbiDigJhkdW1wX2RlY29kZeKAmToKd2FybmluZzog4oCYc25wcmludGbigJkgb3V0
cHV0IG1heSBiZSB0cnVuY2F0ZWQgYmVmb3JlIHRoZSBsYXN0IGZvcm1hdCBjaGFyYWN0ZXIgWy1X
Zm9ybWF0LXRydW5jYXRpb249XQogICBzbnByaW50ZihkZWNvZGUsIHNpemVvZihkZWNvZGUpLCAi
XG4lcyIsIGJpbik7CmludGVsX3JlZy5jOjIwMzozOiBub3RlOiDigJhzbnByaW50ZuKAmSBvdXRw
dXQgYmV0d2VlbiAyIGFuZCAxMDI1IGJ5dGVzIGludG8gYSBkZXN0aW5hdGlvbiBvZiBzaXplIDEw
MjQKWy4uXQoKU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3NpcXVlaXJh
bWVsb0BnbWFpbC5jb20+Ci0tLQogdG9vbHMvaW50ZWxfcmVnLmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90b29scy9p
bnRlbF9yZWcuYyBiL3Rvb2xzL2ludGVsX3JlZy5jCmluZGV4IGRkZmYyNzk0Li4xNWViYjg2YSAx
MDA2NDQKLS0tIGEvdG9vbHMvaW50ZWxfcmVnLmMKKysrIGIvdG9vbHMvaW50ZWxfcmVnLmMKQEAg
LTE4MCw3ICsxODAsNyBAQCBzdGF0aWMgdm9pZCB0b19iaW5hcnkoY2hhciAqYnVmLCBzaXplX3Qg
YnVmbGVuLCB1aW50MzJfdCB2YWwpCiAKIHN0YXRpYyB2b2lkIGR1bXBfZGVjb2RlKHN0cnVjdCBj
b25maWcgKmNvbmZpZywgc3RydWN0IHJlZyAqcmVnLCB1aW50MzJfdCB2YWwpCiB7Ci0JY2hhciBk
ZWNvZGVbMTAyNF07CisJY2hhciBkZWNvZGVbMjA2MF07CiAJY2hhciB0bXBbMTAyNF07CiAJY2hh
ciBiaW5bMTAyNF07CiAKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
