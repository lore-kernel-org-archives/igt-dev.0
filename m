Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0451898EA
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2019 11:40:49 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190701112838.11490-1-janusz.krzysztofik@linux.intel.com>
References: <20190701112838.11490-1-janusz.krzysztofik@linux.intel.com>
Message-ID: <156198123197.1583.5414150863642468839@skylake-alporthouse-com>
Date: Mon, 01 Jul 2019 12:40:31 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] tests/prime_vgem: Fix broken handling
 of interprocess pipes
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKYW51c3ogS3J6eXN6dG9maWsgKDIwMTktMDctMDEgMTI6Mjg6MzgpCj4gSWYgYSBj
aGlsZCBwcm9jZXNzIGRpZXMgZm9yIGFueSByZWFzb24gd2hpbGUgYmFzaWMtZmVuY2UtcmVhZCBv
cgo+IGJhc2ljLWZlbmNlLW1tYXAgc3VidGVzdCBpcyBydW4sIHRoZSBzdWJ0ZXN0IG1heSBoYW5n
IGluZGVmaW5pdGVseSBvbgo+IHJlYWQoKSBmcm9tIGEgcGlwZSB3aGljaCBpcyBzdXBwb3NlZCB0
byBiZSB3cml0dGVuIHRvIGJ5IHRoYXQgY2hpbGQgKGNhbgo+IGJlIGludGVycnVwdGVkIHRob3Vn
aCkuICBGaXggaXQgYnkgZmlyc3QgY2xvc2luZyB1bnVzZWQgcGlwZSBlbmRzIG9uIGJvdGgKPiBw
YXJlbnQgYW5kIGNoaWxkIHNpZGUgYmVmb3JlIHVzaW5nIHRoZSBwaXBlLCBhcyByZWNvbW1lbmRl
ZCBieSBwaXBlKDIpCj4gbWFudWFsIHBhZ2UuCj4gCj4gUGxlYXNlIG5vdGUgdGhhdCBkdWUgdG8g
dGhlIElHVCBsaWJyYXJ5IHdheSBvZiBoYW5kbGluZyBzaWduYWxzLCBub3cgdGhlCj4gc3VidGVz
dHMgbWF5IGZhaWwgd2l0aCBlcnJvciBjb2RlIDE0MSAoMTI4ICsgU0lHUElQRSkgYW5kIG5vIHVz
dWFsIERFQlVHCj4gbWVzc2FnZSBibG9jayBvbiBzdGRlcnIgbm9yIEZBSUwgbWVzc2FnZSBsaW5l
IG9uIHN0ZG91dCwgaG93ZXZlciBzb21lCj4gbWVhbmluZ2Z1bCBlcnJvciBtZXNzYWdlcyB3aWxs
IHN0aWxsIGJlIHByaW50ZWQgb24gc3RkZXJyIGJ5IHRoZSBmYWlsaW5nCj4gY2hpbGQgcHJvY2Vz
c2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbnVzeiBLcnp5c3p0b2ZpayA8amFudXN6Lmtyenlz
enRvZmlrQGxpbnV4LmludGVsLmNvbT4KClRoYXQgd2lsbCB0ZWFjaCBtZSBmb3IgYmVpbmcgbGF6
eS4gKFdobyBhbSBJIGtpZGRpbmc/IFdoZW4gaXQgaXMgc2ltcGxlcgp0byBzaW1wbHkgc2F5IHRo
YXQgKGEpIGlndCB1c2VkIHRvIGV4cGxvZGUgaWYgYSBpZ3RfZm9yaygpZWQgY2hpbGQgZGllZCwK
YW5kIChiKSB3ZSBzaG91bGQgbmV2ZXIgZmFpbCA7KQoKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
