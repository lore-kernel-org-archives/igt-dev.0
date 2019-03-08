Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77926E40E
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 17:14:53 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190307213926.18051-1-ville.syrjala@linux.intel.com>
 <20190307213926.18051-5-ville.syrjala@linux.intel.com>
 <155199551384.27405.6162259249516004249@skylake-alporthouse-com>
In-Reply-To: <155199551384.27405.6162259249516004249@skylake-alporthouse-com>
Message-ID: <155206528392.28502.12491217353181867762@skylake-alporthouse-com>
Date: Fri, 08 Mar 2019 17:14:49 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/kms_setmode: Validate the vbl
 sequence numbers
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMDMtMDcgMjE6NTE6NTQpCj4gUXVvdGluZyBWaWxs
ZSBTeXJqYWxhICgyMDE5LTAzLTA3IDIxOjM5OjI2KQo+ID4gRnJvbTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IAo+ID4gTWFrZSBzdXJlIHdlIGhh
dmVuJ3QgYWxyZWFkeSBwYXNzZWQgdGhlIHNlcSBudW1iZXJzIHdlJ3JlCj4gPiByZXF1ZXN0aW5n
IHdoZW4gZG9pbmcgdGhlIHRzIGNhbGlicmF0aW9uLgo+ID4gCj4gPiBTdWdnZXN0ZWQtYnk6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gU2lnbmVkLW9mZi1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IC0tLQo+
ID4gIHRlc3RzL2ttc19zZXRtb2RlLmMgfCA5ICsrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCA5IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19zZXRtb2Rl
LmMgYi90ZXN0cy9rbXNfc2V0bW9kZS5jCj4gPiBpbmRleCBhY2Q2MDZjZDViNWUuLjVjZTEzOTdm
OTY4ZiAxMDA2NDQKPiA+IC0tLSBhL3Rlc3RzL2ttc19zZXRtb2RlLmMKPiA+ICsrKyBiL3Rlc3Rz
L2ttc19zZXRtb2RlLmMKPiA+IEBAIC00NDcsOCArNDQ3LDE3IEBAIHN0YXRpYyB2b2lkIGNoZWNr
X3RpbWluZ3MoaW50IGNydGNfaWR4LCBjb25zdCBkcm1Nb2RlTW9kZUluZm8gKmttb2RlKQo+ID4g
ICAgICAgICB3YWl0LnJlcXVlc3QudHlwZSB8PSBEUk1fVkJMQU5LX0FCU09MVVRFIHwgRFJNX1ZC
TEFOS19FVkVOVDsKPiA+ICAgICAgICAgd2FpdC5yZXF1ZXN0LnNlcXVlbmNlID0gbGFzdF9zZXE7
Cj4gPiAgICAgICAgIGZvciAobiA9IDA7IG4gPCBDQUxJQlJBVEVfVFNfU1RFUFM7IG4rKykgewo+
ID4gKyAgICAgICAgICAgICAgIGRybVZCbGFuayBjaGVjayA9IHt9Owo+ID4gKwo+ID4gICAgICAg
ICAgICAgICAgICsrd2FpdC5yZXF1ZXN0LnNlcXVlbmNlOwo+ID4gICAgICAgICAgICAgICAgIGRv
X29yX2RpZShkcm1XYWl0VkJsYW5rKGRybV9mZCwgJndhaXQpKTsKPiA+ICsKPiA+ICsgICAgICAg
ICAgICAgICAvKiBEb3VibGUgY2hlY2sgdGhhdCBoYXZlbid0IGFscmVhZHkgbWlzc2VkIHRoZSB2
YmxhbmsgKi8KPiA+ICsgICAgICAgICAgICAgICBjaGVjay5yZXF1ZXN0LnR5cGUgPSBrbXN0ZXN0
X2dldF92YmxfZmxhZyhjcnRjX2lkeCk7Cj4gPiArICAgICAgICAgICAgICAgY2hlY2sucmVxdWVz
dC50eXBlIHw9IERSTV9WQkxBTktfUkVMQVRJVkU7Cj4gPiArICAgICAgICAgICAgICAgZG9fb3Jf
ZGllKGRybVdhaXRWQmxhbmsoZHJtX2ZkLCAmY2hlY2spKTsKPiAKPiBJJ20gdGhpbmtpbmcgdGhp
cyByZWluZm9yY2VzIHRoZSBORVhUT05NSVNTIGFsaWdubWVudCBhcyBvcHBvc2VkIHRvCj4gbWFr
aW5nIHRoYXQgYXJndW1lbnQgbW9vdCA6KQoKQm90aCBjaGVja3MsClJldmlld2VkLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
