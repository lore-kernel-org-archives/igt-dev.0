Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA9D6E182
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 19:05:00 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id j89so6282486ljb.1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2019 12:05:00 -0700 (PDT)
References: <1552993078-16293-1-git-send-email-juhapekka.heikkila@gmail.com>
 <2f4021be-07de-4dbf-04c0-8e2c277d26b3@linux.intel.com>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
Message-ID: <7c2ef595-731e-954f-e0c4-405c298665c2@gmail.com>
Date: Thu, 21 Mar 2019 21:04:56 +0200
MIME-Version: 1.0
In-Reply-To: <2f4021be-07de-4dbf-04c0-8e2c277d26b3@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_available_modes_crc limit
 tested fb formats
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpNYWFydGVuIExhbmtob3JzdCBraXJqb2l0dGkgMjEuMy4yMDE5IGtsbyAxNi4xODoKPiBPcCAx
OS0wMy0yMDE5IG9tIDExOjU3IHNjaHJlZWYgSnVoYS1QZWtrYSBIZWlra2lsYToKPj4gVGhpcyB0
ZXN0IGlzIGNhdXNpbmcgdG9vIG11Y2ggdXNlbGVzcyBub2lzZS4gTGltaXQgdGVzdGVkCj4+IGZi
IGZvcm1hdHMgdG8gRFJNX0ZPUk1BVF9DOCBhbmQgRFJNX0ZPUk1BVF9YQkdSMjEwMTAxMCBmb3Ig
bm93Lgo+PiBUaGVzZSB0d28gZm9ybWF0cyBhcmUgY3VycmVudGx5IG5vdCB0ZXN0ZWQgb3RoZXJ3
aXNlIHRodXMKPj4gdGhleSdyZSBsZWZ0IGhlcmUgZm9yIG5vdy4gRFJNX0ZPUk1BVF9YQkdSMjEw
MTAxMCBuZWVkIHRvIGJlCj4+IGluY2x1ZGVkIGludG8gSUdUIHN1cHBvcnRlZCBmb3JtYXRzIGFu
ZCBEUk1fRk9STUFUX0M4IHRlc3QgbmVlZAo+PiB0byBiZSBtb3ZlZCBlbHNld2hlcmUsIG1heWJl
IGludG8ga21zX3BsYW5lLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxh
IDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPgo+PiAtLS0KPj4gICB0ZXN0cy9rbXNfYXZh
aWxhYmxlX21vZGVzX2NyYy5jIHwgMjg5ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKyksIDE3MyBkZWxl
dGlvbnMoLSkKPj4KPiBJIGxpa2VkIHRoZSBmYWN0IHdlIHdlcmUgdGVzdGluZyB0aGUgc2FtZSB3
aGl0ZSBwb2ludCBldmVyeXdoZXJlLCBidXQgSSBzdXBwb3NlCj4gCj4gdGhhdCdzIHdoYXQga21z
X3BsYW5lIGFscmVhZHkgZG9lcywgYW5kIGl0IG1ha2VzIHNlbnNlIHRvIGdldCByaWQgb2YgdGhp
cy4gOikKPiAKPiBSZXZpZXdlZC1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbQo+IAoKSGVpLCB0aGFua3MgZm9yIHRoZSByZXZpZXcgOikKCkkg
d2FzIGFsc28gcG9uZGVyaW5nIGFib3V0IGZ1dHVyZSBvZiB0aGlzIHRlc3QgYXMga21zX3BsYW5l
IGRvZXMgdGVzdCAKZXZlcnl0aGluZyBpbiBtb3JlIGNvbXByZWhlbnNpdmUgd2F5cy4KCkkgd2Fz
IHRoaW5raW5nIG9uY2UgRFJNX0ZPUk1BVF9YQkdSMjEwMTAxMCBpcyBtYWRlIGFzIElHVCBzdXBw
b3J0ZWQgCmZvcm1hdCBJJ2QgbWF5YmUgcmVuYW1lIHRoaXMgdGVzdCB0byBzb21ldGluZyBhYm91
dCBDOCBhbmQga2VlcCB0aGlzIAp0ZXN0LiBUaGlzIGlzIGR1ZSB0byByZWNlbnRseSBJIHNhdyB0
aGVyZSBpcyBzb21lIGlkZWEgdG8gaGF2ZSAKY29tcGxldGVseSBzZXBhcmF0ZSBwbGFuZSB0ZXN0
ICdqdXN0IGZvciBjb21wYXJpc29uJyBhcyBrbXNfcGxhbmUgZGlkbid0IApjYXRjaCB0aG9zZSBl
cnJvcnMgd2hlcmUgcGxhbmUgYWxwaGEgd2FzIGxlZnQgYXQgdW5leHBlY3RlZCB2YWx1ZS4gV2hp
bGUgCmttc19wbGFuZSB3YXMgc2F5aW5nIGFsbCBpcyBvayB0aGlzIHRlc3Qgd2FzIG5hZ2dpbmcg
YWxsIHRoZSB0aW1lLgoKSSdsbCBwdXNoIHRoaXMgcGF0Y2ggdG9tb3Jyb3cgc28gdGhpcyB0ZXN0
IHN0b3AgbmFnZ2luZyBmb3Igbm93LCBJIGhvcGUuCgovSnVoYS1QZWtrYQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
