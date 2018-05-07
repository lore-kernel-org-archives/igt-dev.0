Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x22b.google.com (mail-wm0-x22b.google.com
 [IPv6:2a00:1450:400c:c09::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB0B46E459
 for <igt-dev@lists.freedesktop.org>; Mon,  7 May 2018 18:23:34 +0000 (UTC)
Received: by mail-wm0-x22b.google.com with SMTP id w194so14822873wmf.2
 for <igt-dev@lists.freedesktop.org>; Mon, 07 May 2018 11:23:34 -0700 (PDT)
Date: Mon, 7 May 2018 20:23:29 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180507182329.GG28661@phenom.ffwll.local>
References: <20180419152704.10851-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180419152704.10851-1-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_force_connector_basic: Don't
 skip when VGA is connected
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBcHIgMTksIDIwMTggYXQgMDY6Mjc6MDRQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFdlIGNhbiBvdmVycmlkZSB0aGUgY29ubmVjdG9yIHN0YXR1cy9FRElEIGp1c3Qg
ZmluZSBldmVuIGlmIHRoZQo+IHRoaW5nIGlzIGFscmVhZHkgY29ubmVjdGVkLiBTbyBsZXQncyBu
b3Qgc2tpcCBpbiB0aGF0IGNhc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkkgdGhpbmsgdmVyeSBsb25nIHRpbWVz
IGFnbyB3ZSBjaGVja2VkIHRoYXQgaXQgZ29lcyBiYWNrIHRvIHVuY29ubmVjdGVkLApvciBzb21l
dGhpbmcgbGlrZSB0aGF0LgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+Cj4gLS0tCj4gIHRlc3RzL2ttc19mb3JjZV9jb25uZWN0b3JfYmFzaWMuYyB8
IDEgLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90
ZXN0cy9rbXNfZm9yY2VfY29ubmVjdG9yX2Jhc2ljLmMgYi90ZXN0cy9rbXNfZm9yY2VfY29ubmVj
dG9yX2Jhc2ljLmMKPiBpbmRleCBkMTFhNzc1YTA4OWQuLjZlOTZjNmJlN2RhYiAxMDA2NDQKPiAt
LS0gYS90ZXN0cy9rbXNfZm9yY2VfY29ubmVjdG9yX2Jhc2ljLmMKPiArKysgYi90ZXN0cy9rbXNf
Zm9yY2VfY29ubmVjdG9yX2Jhc2ljLmMKPiBAQCAtMTE1LDcgKzExNSw2IEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICoqYXJndikKPiAgCj4gIAkJLyogUmVhY3F1aXJlIHN0YXR1cyBhZnRlciBj
bGVhcmluZyBhbnkgcHJldmlvdXMgb3ZlcnJpZGVzICovCj4gIAkJdmdhX2Nvbm5lY3RvciA9IGRy
bU1vZGVHZXRDb25uZWN0b3IoZHJtX2ZkLCB2Z2FfY29ubmVjdG9yX2lkKTsKPiAtCQlpZ3Rfc2tp
cF9vbih2Z2FfY29ubmVjdG9yLT5jb25uZWN0aW9uID09IERSTV9NT0RFX0NPTk5FQ1RFRCk7Cj4g
IAo+ICAJCXN0YXJ0X25fbW9kZXMgPSB2Z2FfY29ubmVjdG9yLT5jb3VudF9tb2RlczsKPiAgCQlz
dGFydF9jb25uZWN0aW9uID0gdmdhX2Nvbm5lY3Rvci0+Y29ubmVjdGlvbjsKPiAtLSAKPiAyLjE2
LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYKCi0t
IApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRw
Oi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
