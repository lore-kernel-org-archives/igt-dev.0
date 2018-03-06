Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC99F6E65C
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 11:03:36 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87a7vlscc9.fsf@intel.com>
References: <20180306092457.25550-1-marta.lofstedt@intel.com>
 <152032872712.17960.5379830358967088465@mail.alporthouse.com>
 <CA5F6A4B62957246A95956419746064382B453BC@IRSMSX106.ger.corp.intel.com>
 <152033311583.17960.7533094600459721936@mail.alporthouse.com>
 <87a7vlscc9.fsf@intel.com>
Message-ID: <152033420783.17960.16211856837385441185@mail.alporthouse.com>
Date: Tue, 06 Mar 2018 11:03:27 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] igt/kms_frontbuffer_tracking: Skip
 tests if FBC was disabled
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
To: Jani Nikula <jani.nikula@intel.com>, "Lofstedt,
 Marta" <marta.lofstedt@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBKYW5pIE5pa3VsYSAoMjAxOC0wMy0wNiAxMDo1NTowMikKPiBPbiBUdWUsIDA2IE1h
ciAyMDE4LCBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4gd3JvdGU6Cj4g
PiBRdW90aW5nIExvZnN0ZWR0LCBNYXJ0YSAoMjAxOC0wMy0wNiAxMDozOTowNCkKPiA+PiAKPiA+
PiAKPiA+PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPj4gPiBGcm9tOiBDaHJpcyBX
aWxzb24gW21haWx0bzpjaHJpc0BjaHJpcy13aWxzb24uY28udWtdCj4gPj4gPiBTZW50OiBUdWVz
ZGF5LCBNYXJjaCA2LCAyMDE4IDExOjMyIEFNCj4gPj4gPiBUbzogTG9mc3RlZHQsIE1hcnRhIDxt
YXJ0YS5sb2ZzdGVkdEBpbnRlbC5jb20+OyBpZ3QtCj4gPj4gPiBkZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPj4gPiBTdWJqZWN0OiBSZTogW2lndC1kZXZdIFtQQVRDSCBpLWctdF0gaWd0L2tt
c19mcm9udGJ1ZmZlcl90cmFja2luZzogU2tpcCB0ZXN0cyBpZgo+ID4+ID4gRkJDIHdhcyBkaXNh
YmxlZAo+ID4+ID4gCj4gPj4gPiBRdW90aW5nIE1hcnRhIExvZnN0ZWR0ICgyMDE4LTAzLTA2IDA5
OjI0OjU3KQo+ID4+ID4gPiBJZiBGQkMgaGFzIGJlZW4gZGlzYWJsZWQgaW4gdGhlIHN5c3RlbSBk
dWUgdG8gcHJldmlvdXMgbWFsZnVjdGlvbiwgd2UKPiA+PiA+ID4gd291bGQgc2F2ZSB0aW1lIG9u
IENJIGlmIHdlIGJhaWwgb3V0IGVhcmx5Lgo+ID4+ID4gPgo+ID4+ID4gPiBCdWd6aWxsYTogaHR0
cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1MzU5Cj4gPj4gPiA+
IFNpZ25lZC1vZmYtYnk6IE1hcnRhIExvZnN0ZWR0IDxtYXJ0YS5sb2ZzdGVkdEBpbnRlbC5jb20+
Cj4gPj4gPiAKPiA+PiA+IEhtbSwgRkJDIHN0YXJ0cyBpbmFjdGl2ZSBvbiBhIHN5c3RlbSwgc28g
d2Ugd291bGQgbmVlZCB0byBlbnN1cmUgdGhhdCB3ZQo+ID4+ID4gZW5hYmxlZCBGQkMgYW5kIGRp
ZCBhIHByb3BlciBtb2Rlc2V0IGZpcnN0IGFuZCB3YWl0IGZvciBGQkMgdG8gYmUgZW5hYmxlZAo+
ID4+ID4gZmlyc3QuCj4gPj4gCj4gPj4gT24gdGhlIFNLTCBOVUNpNSBzeXN0ZW0gSSBoYXZlIGJl
ZW4gcnVubmluZyB0aGlzIG9uLCB0aGUgRkJDIGRpc2FibGVkIHN5c2ZzLCBpc24ndCByZS1zZXQg
YWZ0ZXIgYSBtb2Rlc2V0LiBNYXliZSB0aGlzIGlzIGEgZHJpdmVyIGVycm9yIHRoYXQgc2hvdWxk
IG5vdCBiZSBoaWRkZW4gYnkgbWUgc3VnZ2VzdGluZyB0byBza2lwIHRoZSB0ZXN0cy4gCj4gPgo+
ID4gSXQgbWF5IGp1c3QgYmUgdGhhdCB3ZSBzZWUgdGhlIHNhbWUgZXJyb3IuIFNvbWUgZXJyb3Jz
IGxpa2UgdW5kZXJydW5zCj4gPiBwZXJtYW5lbnRseSBkaXNhYmxlIEZCQyAoYWZhaWspLgo+IAo+
IENvdWxkIHdlIGFkZCBhIHdheSB0byBtYW51YWxseSBmb3JjZSBlbmFibGUgRkJDIGluIHRoYXQg
Y2FzZT8gZGVidWdmcz8KCk9yIGEgKENSVEM/KSBwcm9wZXJ0eSwgdXNlcnNwYWNlIHNldHMgaXQg
dG8gZGVzaXJlZCwga2VybmVsIHVwZGF0ZXMgdG8gb2ZmL29uPwooTm93IHRoYXQgaXMgYSB2ZXJ5
IG9sZCBkcmVhbS4pCi1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
