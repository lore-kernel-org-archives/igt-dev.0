Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D152089AEA
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Oct 2018 13:57:54 +0000 (UTC)
Date: Mon, 15 Oct 2018 16:57:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20181015135746.GA9144@intel.com>
References: <20181015134338.9109-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181015134338.9109-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_frontbuffer_tracking: Do not
 skip on 4k displays.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTUsIDIwMTggYXQgMDM6NDM6MzhQTSArMDIwMCwgTWFhcnRlbiBMYW5raG9y
c3Qgd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFu
a2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMva21zX2Zyb250YnVmZmVyX3Ry
YWNraW5nLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcu
YyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4gaW5kZXggOWFlY2I4MTUwMjRm
Li5iZjRhNjhmZjJiZGUgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNr
aW5nLmMKPiArKysgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwo+IEBAIC0yNDYs
NyArMjQ2LDcgQEAgc3RydWN0IHsKPiAgCS5zaG93X2hpZGRlbj0gZmFsc2UsCj4gIAkuc3RlcCA9
IDAsCj4gIAkub25seV9waXBlcyA9IFBJUEVfQ09VTlQsCj4gLQkuc2hhcmVkX2ZiX3hfb2Zmc2V0
ID0gNTAwLAo+ICsJLnNoYXJlZF9mYl94X29mZnNldCA9IDI0OCwKCkNhbid0IHNlZSB3aHkgNTAw
IHdvdWxkIGJlIGluaGVyZW50bHkgYmV0dGVyIHRoYW4gMjQ4LiBBbHRob3VnaCBJIGhhdmUKdG8g
d29uZGVyIHdoeSAyNDggaW5zdGVhZCBvZiBlZy4gMjU2LiBNYWdpYyBudW1iZXJzIGFyZSBqdXN0
IHRoYXQuCgpSZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KCj4gIAkuc2hhcmVkX2ZiX3lfb2Zmc2V0ID0gNTAwLAo+ICAJLnRpbGluZyA9
IExPQ0FMX0k5MTVfRk9STUFUX01PRF9YX1RJTEVELAo+ICB9Owo+IC0tIAo+IDIuMTkuMQo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gaWd0LWRl
diBtYWlsaW5nIGxpc3QKPiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgoKLS0gClZpbGxl
IFN5cmrDpGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
