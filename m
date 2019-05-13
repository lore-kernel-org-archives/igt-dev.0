Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A69689F71
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2019 15:07:28 +0000 (UTC)
References: <20190429160557.17889-1-maarten.lankhorst@linux.intel.com>
 <8f2230b4-c3b7-7ad5-dd05-fb7c3a9798e6@gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <feacdf9f-f5ba-1c41-76d5-889ac0b17498@linux.intel.com>
Date: Mon, 13 May 2019 17:07:26 +0200
MIME-Version: 1.0
In-Reply-To: <8f2230b4-c3b7-7ad5-dd05-fb7c3a9798e6@gmail.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 0/4] kms_cursor_crc test improvements
 and cleanups.
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
To: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMTEtMDUtMjAxOSBvbSAxNzoxNyBzY2hyZWVmIEp1aGEtUGVra2EgSGVpa2tpbMOkOgo+IFRo
aXMgc2V0IGxvb2sgYWxsIGdvb2QgdG8gbWUsIEkgZGlkbid0IG5vdGljZSBhbnl0aGluZyBJJ2Qg
Y29tbWVudCBhYm91dCBvdGhlciB0aGFuOgo+Cj4gUmV2aWV3ZWQtYnk6IEp1aGEtUGVra2EgSGVp
a2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+Cj4KPiBNYWFydGVuIExhbmtob3Jz
dCBraXJqb2l0dGkgMjkuNC4yMDE5IGtsbyAxOS4wNToKPj4gVGhlIHRlc3RzIHdlcmUgcnVubmlu
ZyBvbiBlYWNoIG91dHB1dCBvbiBlYWNoIHBpcGUsIGFuZCBkaWQgc29tZSBjbGVhbnVwCj4+IHRo
YXQgc2hvdWxkIGJlIGRvbmUgaW4gaWd0X2Rpc3BsYXlfcmVzZXQoKS4gRml4IHRoZSB0ZXN0IHRv
IHVzZSBpZ3Rfa21zCj4+IGNhbGxzIGFsbCB0aGUgdGltZSwgYW5kIHJlbW92ZSBhbGwgaGFuZC1y
b2xsZWQgY2xlYW51cC4KPj4KPj4gQXMgYSBib251cywgd2UgY2FuIG5vdyBydW4gdGhlIHNhbWUg
dGVzdCBvbiBhbiBvdmVybGF5IHBsYW5lIHdpdGggYQo+PiBzL0NVUlNPUi9PVkVSTEFZLyBhcyBh
IHNhbml0eSBjaGVjayB0aGF0IHRoZSB0ZXN0IHRoZW1zZWx2ZXMgYXJlIGNvcnJlY3QuCj4+Cj4+
IE1hYXJ0ZW4gTGFua2hvcnN0ICg0KToKPj4gwqDCoCB0ZXN0cy9rbXNfY3Vyc29yX2NyYzogUnVu
IHRlc3RzIG9uY2UgcGVyIHBpcGUKPj4gwqDCoCB0ZXN0cy9rbXNfY3Vyc29yX2NyYzogSGFuZGxl
IGRpc3BsYXkgY2xlYW51cCBpbiBpbml0Cj4+IMKgwqAgbGliL2lndF9rbXM6IFVwZGF0ZSBjdXJz
b3Igd2hlbiBmYiB3aWR0aC9oZWlnaHQgY2hhbmdlcyB0b28uCj4+IMKgwqAgdGVzdHMva21zX2N1
cnNvcl9jcmM6IFVzZSBpZ3Rfa21zIGNhbGxzIGZvciBldmVyeXRoaW5nLgo+Pgo+PiDCoCBsaWIv
aWd0X2ttcy5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPj4gwqAgdGVzdHMva21zX2N1
cnNvcl9jcmMuYyB8IDIzOCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDExNCBpbnNlcnRpb25zKCspLCAxMjggZGVsZXRpb25z
KC0pCj4+ClRoYW5rcywgcHVzaGVkLiA6KQoKfk1hYXJ0ZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
