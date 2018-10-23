Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034446E0DC
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Oct 2018 13:54:25 +0000 (UTC)
References: <20181008081800.1953-1-stanislav.lisovskiy@intel.com>
 <ce53193d-4334-dc15-2073-a8a3921273f3@linux.intel.com>
 <a6968cc36efede8658fe4b7e1ac6323a108669ce.camel@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <72e51cb3-c919-9dbc-48d7-e6673785fa2b@linux.intel.com>
Date: Tue, 23 Oct 2018 15:54:23 +0200
MIME-Version: 1.0
In-Reply-To: <a6968cc36efede8658fe4b7e1ac6323a108669ce.camel@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v10] lib/igt_fb: Added XYUV format
 support for testing
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
To: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Syrjala, Ville" <ville.syrjala@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMjMtMTAtMTggb20gMTU6NTEgc2NocmVlZiBMaXNvdnNraXksIFN0YW5pc2xhdjoKPiBPbiBU
dWUsIDIwMTgtMTAtMjMgYXQgMTM6MzMgKzAyMDAsIE1hYXJ0ZW4gTGFua2hvcnN0IHdyb3RlOgo+
PiBPcCAwOC0xMC0xOCBvbSAxMDoxOCBzY2hyZWVmIFN0YW5pc2xhdiBMaXNvdnNraXk6Cj4+PiBY
WVVWIGZvcm1hdCBzdXBwb3J0IGhhcyBiZWVuIGFkZGVkIHRvIERSTSwgbW9kaWZpZWQKPj4+IElH
VCB0byByZWZsZWN0IHRob3NlIGNoYW5nZXMuCj4+Pgo+Pj4gdjI6IEZpeGVkIG1lcmdlIGNvbmZs
aWN0LCBzdGFydGVkIHRvIHVzZSBuZXcgeXV2PD0+cmdiCj4+PiAgICAgY29udmVyc2lvbiBmdW5j
dGlvbnMuCj4+Pgo+Pj4gdjM6IEZpeGVkIGttc19hdmFpbGFibGVfbW9kZXNfY3JjIHRlc3QgdG8g
c3VwcG9ydCBuZXcgWFlVVgo+Pj4gICAgIGZvcm1hdC4gRml4ZWQgYSBwcm9ibGVtLCB3aGVyZSB0
ZXN0IGNvbXBsYWlucyB0aGF0IHR3bwo+Pj4gICAgIG91dHB1dHMgbWlnaHQgdXNlIHNhbWUgcGlw
ZSBhdCB0aGUgc2FtZSB0aW1lLgo+Pj4KPj4+IHY0OiBGaXhlZCBjb252ZXJ0aW9uIHByb2NlZHVy
ZSBpbiBpZ3RfZmIgdG8gc3VwcG9ydCBYWVVWCj4+PiAgICAgcHJvcGVybHkuCj4+Pgo+Pj4gdjU6
IEZpeGVkIGEgY29kaW5nIHR5cG8uCj4+Pgo+Pj4gdjY6IFNldCBkZXB0aCBlcXVhbCB0byAtMSBm
b3IgWFlVViBmb3JtYXQgaW4gb3JkZXIgdG8gcHJldmVudAo+Pj4gICAgIGl0IHRvIGJlIHVzZWQg
YnkgaWd0X2JwcF9kZXB0aF90b19kcm1fZm9ybWF0LCBhcyB3ZSBkbyBub3QKPj4+ICAgICB3YW50
IFlVViBmb3JtYXRzIHRvIGJlIHVzZWQgaW4gdGhhdCBjYXNlLgo+Pj4KPj4+IHY3OiBGaXggImJs
YWNrIiBjb2xvciBpbml0aWFsaXphdGlvbiBmb3IgY3JlYXRlX2JvX2Zvcl9mYiB3aXRoCj4+PiAg
ICAgcHJvcGVyIHZhbHVlLiBDaGFuZ2VkIG5hbWluZyAicGxhbmFyX3N0cmlkZSIgdG8gInh5dXZf
c3RyaWRlIi4KPj4+Cj4+PiB2ODogQ2hhbmdlIG5hbWluZyBmcm9tIERSTV9GT1JNQVRfWFlVViB0
byBEUk1fRk9STUFUX1hZVVY4ODg4Cj4+Pgo+Pj4gdjk6IEZpeGVkIGNvbXBpbGF0aW9uIGVycm9y
cyBieSByZWJhc2luZyB0byByZWNlbnQgbWFzdGVyLgo+Pj4KPj4+IHYxMDogQWRkaW5nIHJlZmVy
ZW5jZSB0byBjb3JyZXNwb25kZW50IGtlcm5lbCBjb21taXQgd2l0aCB0aGUgbmV3Cj4+PiBmb3Jt
YXQKPj4+ICAgICAgaW4gaW5jbHVkZS9kcm0tdWFwaQo+Pj4KPj4+IGRybS10aXA6Cj4+PiAJY29t
bWl0IGY3NWRmMmNhZDk4NmY0MGUxOTBlZTk3ZmUzYjQ5ZGQxNzE3NGYxYWYKPj4+IAlBdXRob3I6
IFN0YW5pc2xhdiBMaXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29tPgo+Pj4g
CURhdGU6ICAgRnJpIEp1bCA2IDExOjU3OjI3IDIwMTggKzAzMDAKPj4+Cj4+PiAJICAgIGRybTog
SW50cm9kdWNlIG5ldyBEUk1fRk9STUFUX1hZVVYKPj4gSW4gd2hhdCB0cmVlIGlzIHRoaXMgY29t
bWl0IGluY2x1ZGVkPyBJIGRvbid0IHNlZSBpdCBpbiBkcm0tdGlwLCBkcm0tCj4+IGludGVsIG9y
IGRybS1taXNjLgo+IFRoZSBwYXRjaCBpcyB1bmRlciByZXZpZXcgc3RpbGwuIEl0IGdvdCAiUmV2
aWV3ZWQtYnkiIGp1c3QgbGFzdCB3ZWVrLgpUaGVuIHRoZXJlJ3Mgbm8gc2Vuc2UgaW4gbGlua2lu
ZyB0byBhIGNvbW1pdCwgYSBjb21taXQgSUQgb25seSBleGlzdHMgaWYgaXQncyBpbiBkcm0tbWlz
YyBvciBkcm0taW50ZWwuIDopCgp+TWFhcnRlbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
