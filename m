Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4B2F6E292
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Mar 2018 21:39:56 +0000 (UTC)
From: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Date: Fri, 23 Mar 2018 21:39:44 +0000
Message-ID: <1521842640.2487.4.camel@dk-H97M-D3H>
References: <20180323124828.4350-1-maarten.lankhorst@linux.intel.com>
 <20180323130325.GR5453@intel.com>
 <ed968855-348e-abb7-29f9-644b007b7d99@linux.intel.com>
In-Reply-To: <ed968855-348e-abb7-29f9-644b007b7d99@linux.intel.com>
Content-Language: en-US
Content-ID: <BA4A636EB5CC0341ACD274BD0F847A71@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC incomplete PATCH i-g-t] lib/igt_kms: Reduce
 probing and allow initial hotplug during igt_display_init()
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
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>
List-ID: <igt-dev@lists.freedesktop.org>

DQoNCg0KDQpPbiBGcmksIDIwMTgtMDMtMjMgYXQgMTQ6NTUgKzAxMDAsIE1hYXJ0ZW4gTGFua2hv
cnN0IHdyb3RlOg0KPiBPcCAyMy0wMy0xOCBvbSAxNDowMyBzY2hyZWVmIFZpbGxlIFN5cmrDpGzD
pDoNCj4gPiBPbiBGcmksIE1hciAyMywgMjAxOCBhdCAwMTo0ODoyOFBNICswMTAwLCBNYWFydGVu
IExhbmtob3JzdCB3cm90ZToNCj4gPj4gV2hlbiBib290aW5nIHdpdGggZmJkZXYgZGlzYWJsZWQs
IGFsbCBvdXRwdXRzIGFyZSBzZXQgdG8gVU5LTk9XTkNPTk5FQ1RJT04uDQo+ID4+IEluIHRoaXMg
Y2FzZSB3ZSBoYXZlIHRvIHJlcHJvYmUsIGJ1dCBpbiBhbGwgb3RoZXJzIHdlIGNhbiBzYWZlbHkg
YXNzdW1lIHRoYXQNCj4gPj4gdGhlIG91dHB1dCBjb25uZWN0b3Igc3RhdHVzIGlzIHZhbGlkLg0K
PiA+Pg0KPiA+PiBFbnVtZXJhdGUgYWxsIG91dHB1dHMsIGFuZCBmb3IgZ29vZCBtZWFzdXJlIHJl
Y2hlY2sgYWZ0ZXIgd2UgcHJvYmVkLCB0byBhZGQNCj4gPj4gYW5kIERQLU1TVCB3ZSBtYXkgaGF2
ZSBtaXNzZWQuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxt
YWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+ID4+IENjOiBMeXVkZSA8bHl1ZGVA
cmVkaGF0LmNvbT4NCj4gPj4gQ2M6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFu
ZGl5YW5AaW50ZWwuY29tPg0KPiA+PiAtLS0NCj4gPj4gVW5mb3J0dW5hdGVseSB3ZSBsYWNrIGEg
d2F5IHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBwcm9iaW5nIHdpbGwgZW51bWVyYXRlDQo+ID4+
IGFkZGl0aW9uYWwgRFAtTVNUIGRpc3BsYXlzLCBzbyB0aGUgb25seSB3YXkgcmlnaHQgbm93IHRv
IHRlc3QgRFAtTVNUIHdvdWxkIGJlDQo+ID4+IHRvIGFkZCBhIHNsZWVwKDUpIGluIGlndF9kaXNw
bGF5X2NoZWNrX2hvdHBsdWcuDQo+ID4+DQo+ID4+IEFueSB0aG91Z2h0cyBob3cgd2UgY2FuIG1h
a2UgdGhpcyBtb3JlIHJlbGlhYmxlIGZvciBEUC1NU1Q/DQo+ID4gV2hlbiBkbyB3ZSBmaWxsIG91
dCB0aGUgZGVidWdmcyBtc3QgdG9wb2xvZ3kgaW5mb3JtYXRpb24/DQo+IEkgaGF2ZSBubyBpZGVh
Li4NCj4gDQo+IGRybV9kcF9tc3RfbGlua19wcm9iZV93b3JrIHNlZW1zIHRvIGJlIGNhbGxlZCBm
cm9tIGlycSwgSSBkb24ndCB0aGluayB3ZSBpbml0aWFsbHkgZG8gZGlzY292ZXJ5LCBtYXliZSB3
ZSBzaG91bGQuLg0KDQpDb3JyZWN0IG1lIGlmIEkgYW0gd3JvbmcuDQoNCmdldGNvbm5lY3Rvci0+
ZmlsbF9tb2Rlcy0+ZGV0ZWN0LT5sb25nX3B1bHNlLT5pbnRlbF9kcF9jb25maWd1cmVfbXN0LT5k
cm1fZHBfbXN0X2xpbmtfcHJvYmVfd29yayBzaG91bGQgbGVhZCB0bw0KL3N5cy9rZXJuZWwvZGVi
dWcvZHJpLzAvaTkxNV9kcF9tc3RfaW5mbyBwb3B1bGF0aW5nIHRoZSBzdGF0dXMgb2YgZG93bnN0
cmVhbSBjb25uZWN0b3JzLg0KDQpJc24ndCBpdCBwb3NzaWJsZSB0byB3YWl0IG9uIHRoYXQ/DQoN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
