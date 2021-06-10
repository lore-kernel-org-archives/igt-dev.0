Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Thu, 10 Jun 2021 08:52:38 +0000
Message-ID: <BY5PR11MB43728FBA9BCC7BDCFE9588CE89359@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1622176025-12499-1-git-send-email-vidya.srinivas@intel.com>
 <CO6PR11MB55693230CBD2262DDCF5A0C18D379@CO6PR11MB5569.namprd11.prod.outlook.com>
 <80bed39a-e899-f211-ae2f-279312b52084@gmail.com>
 <BY5PR11MB4372F22C0AF1AEC2CD3A20D089379@BY5PR11MB4372.namprd11.prod.outlook.com>
 <BY5PR11MB437298B9B622322E6663495E89379@BY5PR11MB4372.namprd11.prod.outlook.com>
 <dc3df242-57b9-13f9-c5ab-42acadc39c86@gmail.com>
 <BY5PR11MB43727C61A55E03DA6EE2C53589359@BY5PR11MB4372.namprd11.prod.outlook.com>
 <YMHSfaK9We4Mzh54@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YMHSfaK9We4Mzh54@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] [RFC] tests/kms_big_fb:
 Wait for vblank before collecting CRC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhhbmsgeW91IHNvIG11Y2ggUGV0cmkuIEkgc2VlIGl04oCZcyBhIFBBU1MgZm9yIGFsbW9zdCBl
dmVyeXRoaW5nIGV4Y2VwdCBvbiBvbmUgR0xLLg0KDQpSZWdhcmRzDQpWaWR5YQ0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTGF0dmFsYSwgUGV0cmkgPHBldHJpLmxhdHZhbGFA
aW50ZWwuY29tPiANClNlbnQ6IFRodXJzZGF5LCBKdW5lIDEwLCAyMDIxIDI6MjEgUE0NClRvOiBT
cmluaXZhcywgVmlkeWEgPHZpZHlhLnNyaW5pdmFzQGludGVsLmNvbT4NCkNjOiBqdWhhcGVra2Eu
aGVpa2tpbGFAZ21haWwuY29tOyBNb2RlbSwgQmhhbnVwcmFrYXNoIDxiaGFudXByYWthc2gubW9k
ZW1AaW50ZWwuY29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IExpbiwgQ2hhcmx0b24gPGNoYXJsdG9uLmxpbkBpbnRlbC5j
b20+DQpTdWJqZWN0OiBSZTogW2lndC1kZXZdIFtJbnRlbC1nZnhdIFtQQVRDSCBpLWctdF0gW1JG
Q10gdGVzdHMva21zX2JpZ19mYjogV2FpdCBmb3IgdmJsYW5rIGJlZm9yZSBjb2xsZWN0aW5nIENS
Qw0KDQpPbiBUaHUsIEp1biAxMCwgMjAyMSBhdCAwODozODo0MkFNICswMDAwLCBTcmluaXZhcywg
VmlkeWEgd3JvdGU6DQo+IEhlbGxvIEp1aGEtUGVra2EsDQo+IA0KPiBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzkwMzg5LyNyZXY3IHNob3dzIFBBU1MgZm9yIGFsbCBD
SS4NCj4gSG93ZXZlciBJIGRvbuKAmXQgc2VlIGttc19iaWdfZmIgYWxsIHRoZSBzdWJ0ZXN0cyBy
dW5uaW5nIGluIENJLiBJbiB0aGUgDQo+IGxvZ3MgSSBzZWUgcGFzcyBmb3IgbGluZWFyLTMyYnBw
LXJvdGF0ZS0wDQoNClRoZSBkZWZhdWx0IHZpZXcgaW4gdGhlIENJIHJlc3VsdHMgb25seSBzaG93
cyB0ZXN0cyB0aGF0IGhhdmUgaXNzdWVzLiAidmlldyAtPiBzaGFyZHMgYWxsIiBmcm9tIHRoZSB0
b3Agc2hvd3MgYWxsIHRlc3RzLg0KDQpodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzU5MDcvc2hhcmRzLWFsbC5odG1sP3Rlc3RmaWx0ZXI9a21zX2JpZ19mYg0K
DQoNCi0tDQpQZXRyaSBMYXR2YWxhDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1nZngK
