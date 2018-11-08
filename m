Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003C46E464
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Nov 2018 15:37:52 +0000 (UTC)
References: <20181108112510.16764-1-lionel.g.landwerlin@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <0b36d59b-3841-9a39-46bd-16aaeb4dd595@linux.intel.com>
Date: Thu, 8 Nov 2018 15:37:47 +0000
MIME-Version: 1.0
In-Reply-To: <20181108112510.16764-1-lionel.g.landwerlin@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/query: more accurate
 available/fused topology printout
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
Cc: tvrtko.ursulin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA4LzExLzIwMTggMTE6MjUsIExpb25lbCBMYW5kd2VybGluIHdyb3RlOgo+IE1ha2UgYXZh
aWxhYmlsaXR5IG9mIGFsbCBlbGVtZW50cyBtb3JlIHZpc2libGUgZm9yIGRlYnVnIHB1cnBvc2Vz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2Vy
bGluQGludGVsLmNvbT4KPiAtLS0KPiAgIHRlc3RzL2k5MTUvcXVlcnkuYyB8IDEyICsrKysrKysr
KystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvcXVlcnkuYyBiL3Rlc3RzL2k5MTUvcXVlcnku
Ywo+IGluZGV4IDA4YWFiZjk0Li4zZTdmZDE0MCAxMDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L3F1
ZXJ5LmMKPiArKysgYi90ZXN0cy9pOTE1L3F1ZXJ5LmMKPiBAQCAtMzczLDEyICszNzMsMjAgQEAg
dGVzdF9xdWVyeV90b3BvbG9neV9tYXRjaGVzX2V1X3RvdGFsKGludCBmZCkKPiAgIAlmb3IgKHMg
PSAwOyBzIDwgdG9wb19pbmZvLT5tYXhfc2xpY2VzOyBzKyspIHsKPiAgIAkJaW50IHNzOwo+ICAg
Cj4gLQkJaWd0X2RlYnVnKCJzbGljZSVpOlxuIiwgcyk7Cj4gKwkJaWd0X2RlYnVnKCJzbGljZSVp
OiAoJXMpXG4iLCBzLAo+ICsJCQkgIHNsaWNlX2F2YWlsYWJsZSh0b3BvX2luZm8sIHMpID8gImF2
YWlsYWJsZSIgOiAiZnVzZWQiKTsKPiArCj4gKwkJaWYgKCFzbGljZV9hdmFpbGFibGUodG9wb19p
bmZvLCBzKSkKPiArCQkJY29udGludWU7Cj4gICAKPiAgIAkJZm9yIChzcyA9IDA7IHNzIDwgdG9w
b19pbmZvLT5tYXhfc3Vic2xpY2VzOyBzcysrKSB7Cj4gICAJCQlpbnQgZXUsIG5fc3Vic2xpY2Vf
ZXVzID0gMDsKPiAgIAo+IC0JCQlpZ3RfZGVidWcoIlx0c3Vic2xpY2U6ICVpXG4iLCBzcyk7Cj4g
KwkJCWlndF9kZWJ1ZygiXHRzdWJzbGljZSVpOiAoJXMpXG4iLCBzcywKPiArCQkJCSAgc3Vic2xp
Y2VfYXZhaWxhYmxlKHRvcG9faW5mbywgcywgc3MpID8gImF2YWlsYWJsZSIgOiAiZnVzZWQiKTsK
PiArCj4gKwkJCWlmICghc3Vic2xpY2VfYXZhaWxhYmxlKHRvcG9faW5mbywgcywgc3MpKQo+ICsJ
CQkJY29udGludWU7Cj4gICAKPiAgIAkJCWlndF9kZWJ1ZygiXHRcdGV1X21hc2s6IDBiIik7Cj4g
ICAJCQlmb3IgKGV1ID0gMDsgZXUgPCB0b3BvX2luZm8tPm1heF9ldXNfcGVyX3N1YnNsaWNlOyBl
dSsrKSB7Cj4gCgpMb29rcyBsaWtlIGEgbm8tYnJhaW5lciBub3cuCgpSZXZpZXdlZC1ieTogVHZy
dGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClJlZ2FyZHMsCgpUdnJ0a28K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
