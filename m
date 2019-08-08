Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <87imr78yqc.fsf@gaia.fi.intel.com>
References: <20190806081052.11564-1-chris@chris-wilson.co.uk>
 <20190806084939.20203-1-chris@chris-wilson.co.uk>
 <87imr78yqc.fsf@gaia.fi.intel.com>
Message-ID: <156527844980.22627.14726758959554624075@skylake-alporthouse-com>
Date: Thu, 08 Aug 2019 16:34:09 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_persistent_relocs: Don't call
 DROP_IDLE in the middle of submitting
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
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNaWthIEt1b3BwYWxhICgyMDE5LTA4LTA4IDE2OjI2OjM1KQo+IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cml0ZXM6Cj4gCj4gPiBUbyBhY3R1YWxseSBE
Uk9QX0lETEUgbWVhbnMgdGhhdCB3ZSBoYXZlIHRvIHdhaXQgZm9yIG9uZ29pbmcgc3VibWlzc2lv
biwKPiA+IGFuZCBhbnkgbmV3IGNvbmN1cnJlbnRseSBzdWJtaXR0ZWQsIGkuZS4gaXQgc2hvdWxk
IG9ubHkgYmUgY2FsbGVkIGR1cmluZwo+ID4gc2luZ2xlLXRocmVhZGVkIHN1Ym1pc3Npb24gdG8g
ZW5zdXJlIHRoZSBHUFUgaXMgaWRsZSBiZWZvcmUgdGhlIG5ldwo+ID4gYWN0aW9uLgo+ID4KPiA+
IHYyOiBBbHNvIGluY2x1ZGUgU0hSSU5LIGZvciB0aHJhc2gtYWxsLXRoZS10aGluZ3MsIGFuZCBm
aW5kIGEgZHVwZSBpbgo+ID4gZ2VtX3JlbG9jX3ZzX2dwdS4KPiAKPiBBZ3JlZWQgdGhhdCBpcyBy
YXRoZXIgcG9pbnRsZXNzIHRyeWluZyB0byBndWFyYW50ZWUgYW4gaWRsZSBncHUKPiBkdXJpbmcg
YSB0ZXN0Lgo+IAo+IFJldmlld2VkLWJ5OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxp
bnV4LmludGVsLmNvbT4KPiAKPiBCdXQgYmV0d2VlbiBhIHRlc3RzLCBpdCB3aWxsIHNlcnZlIGFz
IGEgZmx1c2g/CgpBdCB0aGUgZW5kIG9mIGEgX3Rlc3RfIChiaW5hcnkpLCB3ZSBkbyByZXNldCBh
bmQgaWRsZSB0aGUgR1BVLiBUaGUKdGhlb3J5IGlzIHRoYXQgd2Ugd2FudCBlYWNoIHRlc3QgdG8g
aGF2ZSBhIGNsZWFuIHNsYXRlLCBhbmQgdG8gY2F0Y2ggYW55CnJlc2lkdWFsIHByb2JsZW1zIGlu
IHRoZSB0ZXN0IHRoYXQgY3JlYXRlZCB0aGVtLgoKQnV0IHdlIGRvbid0IGRvIGFueXRoaW5nIGJl
dHdlZW4gc3VidGVzdHMgYnkgZGVmYXVsdCwgYW5kIHdlIGZyZXF1ZW50bHkKcnVuIGludG8gcHJv
YmxlbXMgdGhlcmUgaWYgb25lIHN1YnRlc3QgZmFpbHMgYW5kIGNhdXNlcyB0aGUgbmV4dCB0bwpm
YWlsIGFuZCBzbyBvbiBhbmQgc28gb24uIEFuIHVuc29sdmVkIGRpbGVtbWEuCi1DaHJpcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
