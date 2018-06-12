Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42BC66E4B7
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Jun 2018 11:59:29 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180612095918.27357-2-michal.winiarski@intel.com>
References: <20180612095918.27357-1-michal.winiarski@intel.com>
 <20180612095918.27357-2-michal.winiarski@intel.com>
Message-ID: <152880475803.11830.17038241986830408194@mail.alporthouse.com>
Date: Tue, 12 Jun 2018 12:59:18 +0100
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] igt/evictions: Avoid getting killed
 by the reaper in mlock
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
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNaWNoYcWCIFdpbmlhcnNraSAoMjAxOC0wNi0xMiAxMDo1OToxOCkKPiBXZSdyZSBs
aXR0bGUgYml0IHRvbyBlbnRodXNpYXN0aWMgaW4gb3VyIGluaXRpYWwgYXR0ZW1wdCB0byBsb2Nr
IGFsbAo+IGF2YWlsYWJsZSBtZW1vcnkuIExldCdzIHVzZSB0aGUgbWxvY2sgcHJvYmUgZnJvbSBs
aWIgcmF0aGVyIHRoYW4gdHJ5aW5nCj4gdG8gbG9jayBldmVyeXRoaW5nIHRoYXQgc3lzaW5mby5m
cmVlcmFtIGhhcyB0byBvZmZlci4KPiBOb3RlIHRoYXQgd2UncmUgb25seSB0d2Vha2luZyB0aGUg
aW5pdGlhbCBzdGVwIC0gaXQncyBzdGlsbCBwb3NzaWJsZQo+IHRoYXQgd2UncmUgZ29pbmcgdG8g
Z2V0IGtpbGxlZCBsYXRlciBvbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYcWCIFdpbmlhcnNr
aSA8bWljaGFsLndpbmlhcnNraUBpbnRlbC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNA
Y2hyaXMtd2lsc29uLmNvLnVrPgo+IENjOiBFd2VsaW5hIE11c2lhbCA8ZXdlbGluYS5tdXNpYWxA
aW50ZWwuY29tPgoKU2VlbXMgYSByZWFzb25hYmxlIHN0cmFpZ2h0IGZvcndhcmQgY29udmVyc2lv
biwKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgot
Q2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
