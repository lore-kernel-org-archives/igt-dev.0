Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91926E970
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2018 14:57:13 +0000 (UTC)
Date: Wed, 28 Feb 2018 16:57:09 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180228145709.GH5453@intel.com>
References: <20180227212120.25501-1-ville.syrjala@linux.intel.com>
 <20180227212120.25501-5-ville.syrjala@linux.intel.com>
 <151976719317.21577.16909839422802919294@mail.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <151976719317.21577.16909839422802919294@mail.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/8] lib: Add igt_matrix
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMjcsIDIwMTggYXQgMDk6MzM6MTNQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgVmlsbGUgU3lyamFsYSAoMjAxOC0wMi0yNyAyMToyMToxNykKPiA+ICsj
aW5jbHVkZSAiaWd0X2NvcmUuaCIKPiA+ICsjaW5jbHVkZSAiaWd0X21hdHJpeC5oIgo+ID4gKwo+
ID4gKy8qKgo+ID4gKyAqIFNFQ1RJT046aWd0X21hdHJpeAo+ID4gKyAqIEBzaG9ydF9kZXNjcmlw
dGlvbjogTWF0cml4IG1hdGggbGlicmFyeQo+ID4gKyAqIEB0aXRsZTogTWF0cml4Cj4gPiArICog
QGluY2x1ZGU6IGlndC5oCj4gPiArICoKPiA+ICsgKiBUaGlzIGxpYnJhcnkgY29udGFpbnMgaGVs
cGVyIGZ1bmN0aW9ucyBmb3IgYmFzaWMgbWF0cml4IG1hdGguCj4gPiArICogVGhlIGxpYnJhcnkg
b3BlcmF0ZXMgb24gI2lndF9tYXQ0IGFuZCAjaWd0X3ZlYzQgc3RydWN0dXJlcy4KPiA+ICsgKi8K
PiA+ICsKPiA+ICsvKioKPiA+ICsgKiBpZ3RfbWF0cml4X3ByaW50Ogo+ID4gKyAqIEBtOiB0aGUg
bWF0cml4Cj4gPiArICoKPiA+ICsgKiBQcmludCBvdXQgdGhlIG1hdHJpeCBlbGVtZW50cy4KPiA+
ICsgKi8KPiA+ICt2b2lkIGlndF9tYXRyaXhfcHJpbnQoY29uc3Qgc3RydWN0IGlndF9tYXQ0ICpt
KQo+ID4gK3sKPiA+ICsgICAgICAgZm9yIChpbnQgcm93ID0gMDsgcm93IDwgNDsgcm93KyspIHsK
PiA+ICsgICAgICAgICAgICAgICBpZ3RfaW5mbygifCIpOwo+ID4gKyAgICAgICAgICAgICAgIGZv
ciAoaW50IGNvbCA9IDA7IGNvbCA8IDQ7IGNvbCsrKSB7Cj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBpZ3RfaW5mbygiJTQuNGYsIiwgbS0+ZFtjb2wgKiA0ICsgcm93XSk7Cj4gCj4gI2RlZmlu
ZSBtKHJvdywgY29sKSAoKGNvbCkgKiA0ICsgKHJvdykpID8KClNlZW1zIGxpa2UgYSBzZW5zaWJs
ZSBpZGVhLgoKPiAKPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgaWd0
X2luZm8oInxcbiIpOwo+ID4gKyAgICAgICB9Cj4gPiArfQo+ID4gKwo+ID4gKy8qKgo+ID4gKyAq
IGlndF9tYXRyaXhfaWRlbnRpdHk6Cj4gPiArICoKPiA+ICsgKiBSZXR1cm5zOgo+ID4gKyAqIEFu
IGlkZW50aXR5IG1hdHJpeC4KPiA+ICsgKi8KPiA+ICtzdHJ1Y3QgaWd0X21hdDQgaWd0X21hdHJp
eF9pZGVudGl0eSh2b2lkKQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IGlndF9tYXQ0IHJldCA9
IHsKPiA+ICsgICAgICAgICAgICAgICAuZFswICogNCArIDBdID0gMS4wZiwKPiA+ICsgICAgICAg
ICAgICAgICAuZFsxICogNCArIDFdID0gMS4wZiwKPiA+ICsgICAgICAgICAgICAgICAuZFsyICog
NCArIDJdID0gMS4wZiwKPiA+ICsgICAgICAgICAgICAgICAuZFszICogNCArIDNdID0gMS4wZiwK
PiA+ICsgICAgICAgfTsKPiAKPiBzdGF0aWMgPwoKQWxzbyBjb25zdCBJIHN1cHBvc2UuCgpJJ3Zl
IG5vdCBhY3R1YWxseSBjaGVja2VkIHdoYXQga2luZCBvZiBhIGpvYiB0aGUgY29tcGlsZXIgZG9l
cyB3aGVuIHlvdQpyZXR1cm4gYmlnIGJsb2JzIGxpa2UgdGhpcyBmcm9tIGZ1bmN0aW9ucy4gU2hv
dWxkIHByb2JhYmx5IGxvb2sgaW50bwp0aGF0IHRvIG1ha2Ugc3VyZSB0aGUgcmVzdWx0aW5nIGNv
ZGUgaXMgbm90IHRvdGFsbHkgaW5zYW5lLgoKPiAKPiBEaWRuJ3Qgc3BvdCBhbnkgdHlwb3MuCj4g
LUNocmlzCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsIE9UQwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
