Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20E6E0BC
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 15:20:48 +0000 (UTC)
References: <20180129120347.29287-1-lionel.g.landwerlin@intel.com>
 <CAM0jSHOE2he6xWJKQtpnDFSVwKC6g7YhdxhhRRs7JW-pkR8m8w@mail.gmail.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Message-ID: <c35cedac-49ab-7c9b-b584-ade35877a048@intel.com>
Date: Thu, 1 Feb 2018 15:20:46 +0000
MIME-Version: 1.0
In-Reply-To: <CAM0jSHOE2he6xWJKQtpnDFSVwKC6g7YhdxhhRRs7JW-pkR8m8w@mail.gmail.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/perf: fix report validity check
 on gen10+
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMzEvMDEvMTggMjA6MDQsIE1hdHRoZXcgQXVsZCB3cm90ZToKPiBPbiAyOSBKYW51YXJ5IDIw
MTggYXQgMTI6MDMsIExpb25lbCBMYW5kd2VybGluCj4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50
ZWwuY29tPiB3cm90ZToKPj4gU2lnbmVkLW9mZi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25l
bC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgo+PiBUZXN0Y2FzZTogaWd0L3BlcmYvYnVmZmVyLWZp
bGwgJiBpZ3QvcGVyZi9lbmFibGUtZGlzYWJsZSAmIGlndC9wZXJmL2dlbjgtdW5wcml2aWxlZ2Vk
LXNpbmdsZS1jdHgtY291bnRlcnMKPj4gQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3Rv
cC5vcmcvc2hvd19idWcuY2dpP2lkPTEwNDY1OAo+PiAtLS0KPj4gICB0ZXN0cy9wZXJmLmMgfCAy
ICstCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+
Cj4+IGRpZmYgLS1naXQgYS90ZXN0cy9wZXJmLmMgYi90ZXN0cy9wZXJmLmMKPj4gaW5kZXggYTE3
MzY4MGMuLjU1ZDZlOWVhIDEwMDY0NAo+PiAtLS0gYS90ZXN0cy9wZXJmLmMKPj4gKysrIGIvdGVz
dHMvcGVyZi5jCj4+IEBAIC00NzMsNyArNDczLDcgQEAgb2FfcmVwb3J0X2N0eF9pc192YWxpZCh1
aW50MzJfdCAqcmVwb3J0KQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsgLyogVE9E
TyAqLwo+PiAgICAgICAgICB9IGVsc2UgaWYgKElTX0dFTjgoZGV2aWQpKSB7Cj4+ICAgICAgICAg
ICAgICAgICAgcmV0dXJuIHJlcG9ydFswXSAmICgxdWwgPDwgMjUpOwo+PiAtICAgICAgIH0gZWxz
ZSBpZiAoSVNfR0VOOShkZXZpZCkpIHsKPj4gKyAgICAgICB9IGVsc2UgaWYgKEFUX0xFQVNUX0dF
TihkZXZpZCwgOSkpIHsKPj4gICAgICAgICAgICAgICAgICByZXR1cm4gcmVwb3J0WzBdICYgKDF1
bCA8PCAxNik7Cj4+ICAgICAgICAgIH0KPiBEbyB3ZSB3YW50IHRvIGRyb3AgdGhlICEicmVhY2hl
ZCIsIHNpbmNlIHRoaXMgaXMgbm93IHZlcnkgbXVjaCBhIGNhdGNoIGFsbD8KPgo+IEFueXdheToK
PiBSZXZpZXdlZC1ieTogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPgo+ClRo
YW5rcyBNYXR0LCBkZWNpZGVkIHRvIGxlYXZlIHRoYXQgYXNzZXJ0IGZvciBub3cuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
