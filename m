Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0566E15A
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2019 14:22:13 +0000 (UTC)
From: "Ser, Simon" <simon.ser@intel.com>
Date: Tue, 13 Aug 2019 14:22:11 +0000
Message-ID: <819ea7c50585114a55ae76fdcacc76798f845ec9.camel@intel.com>
References: <20190813070421.17633-1-ramalingam.c@intel.com>
In-Reply-To: <20190813070421.17633-1-ramalingam.c@intel.com>
Content-Language: en-US
Content-ID: <3CC4678E9D26D943898FCF412EF9E9A4@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/display_require: reset hdcp on all
 connectors
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "C,
 Ramalingam" <ramalingam.c@intel.com>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA4LTEzIGF0IDEyOjM0ICswNTMwLCBSYW1hbGluZ2FtIEMgd3JvdGU6DQo+
IEF0IHRoZSBzdGFydCBvZiBldmVyeSB0ZXN0LCByZXNldCBIRENQIHN0YXRlIHRvIFVOREVTSVJF
RCBvbiBhbGwNCj4gY29ubmVjdG9ycywgc28gdGhhdCB3ZSB3aWxsIG5vdCBoYXZlIGFueSBoZGNw
IHJlbGF0ZWQgbm9pc2VzIGluDQo+IHRoZSBzdWJzZXF1ZW50IHRlc3RzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPg0KPiBCdWd6aWxs
YTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTExMzkwDQo+
IC0tLQ0KPiAgbGliL2lndF9rbXMuYyB8IDQgKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9saWIvaWd0X2tt
cy5jDQo+IGluZGV4IGIwMTY5ZjczYjc1Mi4uNjg2NTBhZTNkN2U5IDEwMDY0NA0KPiAtLS0gYS9s
aWIvaWd0X2ttcy5jDQo+ICsrKyBiL2xpYi9pZ3Rfa21zLmMNCj4gQEAgLTE4NTksNiArMTg1OSwx
MCBAQCBzdGF0aWMgdm9pZCBpZ3Rfb3V0cHV0X3Jlc2V0KGlndF9vdXRwdXRfdCAqb3V0cHV0KQ0K
PiAgCWlmIChpZ3Rfb3V0cHV0X2hhc19wcm9wKG91dHB1dCwgSUdUX0NPTk5FQ1RPUl9CUk9BRENB
U1RfUkdCKSkNCj4gIAkJaWd0X291dHB1dF9zZXRfcHJvcF92YWx1ZShvdXRwdXQsIElHVF9DT05O
RUNUT1JfQlJPQURDQVNUX1JHQiwNCj4gIAkJCQkJICBCUk9BRENBU1RfUkdCX0ZVTEwpOw0KPiAr
DQo+ICsJaWYgKGlndF9vdXRwdXRfaGFzX3Byb3Aob3V0cHV0LCBJR1RfQ09OTkVDVE9SX0NPTlRF
TlRfUFJPVEVDVElPTikpDQo+ICsJCWlndF9vdXRwdXRfc2V0X3Byb3BfdmFsdWUob3V0cHV0LCBJ
R1RfQ09OTkVDVE9SX0NPTlRFTlRfUFJPVEVDVElPTiwNCj4gKwkJCQkJICAwKTsNCg0KVGhpcyBo
YXJkY29kZXMgVU5ERVNJUkVEJ3MgdmFsdWUuIE1heWJlIHdlIGNhbiB1c2UNCmlndF9vdXRwdXRf
c2V0X3Byb3BfZW51bSBpbnN0ZWFkPw0KDQo+ICB9DQo+ICANCj4gIC8qKg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
