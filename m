Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24AE96E54E
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Mar 2019 07:50:51 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <b45714c8ec351a3dcde4c353fbfd23aa4c73851d.1553898290.git.caz.yokoyama@intel.com>
In-Reply-To: <b45714c8ec351a3dcde4c353fbfd23aa4c73851d.1553898290.git.caz.yokoyama@intel.com>
Message-ID: <155393224504.24691.5204883884060280144@skylake-alporthouse-com>
Date: Sat, 30 Mar 2019 07:50:45 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/1] i915_pm_rpm: remove
 gem-execbuf-stress-extra-wait because same as gem-execbuf-stress
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
To: Caz Yokoyama <caz.yokoyama@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDYXogWW9rb3lhbWEgKDIwMTktMDMtMjkgMjI6MjY6MTMpCj4gRXh0cmEgNXNlYyBk
ZWxheSBkb2VzIG5vdCBhZGQgYW55IHZhbHVlIG1vcmUgdGhhbiBnZW0tZXhlY2J1Zi1zdHJlc3Mu
Cj4gSXQgd2FpdHMgdW50aWwgc3VzcGVuZCBzdGF0ZSBhZnRlciBhIGpvYiBpcyBhZGRlZCBieSBn
ZW1fZXhlY2J1ZigpLgo+IFRoZXJlIGlzIG5vIG5lZWQgdG8gZG8gbW9yZSB3aGVuIEdQVSBiZWNv
bWVzIHN1c3BlbmRlZCBzdGF0ZS4KPiBJIGNvbmZpcm0gdGhpcyBieSBsb29raW5nIGF0IHBtX3J1
bnRpbWVfZm9yY2Vfc3VzcGVuZCgpIHdoaWNoIGV4aXRzCj4gb24gc3VzcGVuZCBzdGF0ZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDYXogWW9rb3lhbWEgPGNhei55b2tveWFtYUBpbnRlbC5jb20+Cj4g
Q2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoKVGhlcmUgaXMgbm8g
ZGlmZmVyZW5jZSB3cnQgdG8gdGhlIGRyaXZlciB0aGF0IGV4dHJhLXdhaXQgd291bGQgY292ZXIK
dGhhdCBpc24ndCBjb3ZlcmVkIGJ5IHRoZSBvdGhlciBleGVjYnVmLXN0cmVzcyB2YXJpYW50cy4g
VGhlIHdhaXQgaXMKcHVyZSBwYXJhbm9pYSB0aGF0IHRoZSBIVyBkb2VzIHNvbWV0aGluZyB1bmRl
cm5lYXRoIHRoZSBjb3ZlcnMgdGhhdAppbnRlcmZlcmVzIHdpdGggdXMuIFRoZSBsaWtlbGlob29k
IG9mIHRoaXMgdGVzdCBldmVuIHNwb3R0aW5nIHRoYXQ/ClNsaW0uIFN0aWxsIEkgY2FuJ3QgcnVs
ZSBvdXQgdGhhdCBpdCBtYXksIHNvIHVzZWZ1bCB0byBrZWVwIGFyb3VuZCBmb3IKaW52ZXN0aWdh
dGlvbnMuCgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28u
dWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
