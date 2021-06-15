Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8DF8992E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 08:50:28 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Tue, 15 Jun 2021 08:50:20 +0000
Message-ID: <BY5PR11MB4372607E6D544F2B74E30E4E89309@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <80bed39a-e899-f211-ae2f-279312b52084@gmail.com>
 <1623143106-8423-1-git-send-email-vidya.srinivas@intel.com>
 <5bd96874-ec95-e560-9793-e3bdcbd9beec@gmail.com>
 <BY5PR11MB437223C6D52194553D9CEE1589359@BY5PR11MB4372.namprd11.prod.outlook.com>
 <BY5PR11MB43726A95B6BB9E0A0EBCA14A89309@BY5PR11MB4372.namprd11.prod.outlook.com>
 <YMhp2xqqeAaVWTEC@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YMhp2xqqeAaVWTEC@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Use
 igt_pipe_crc_get_current instead of igt_pipe_crc_collect_crc
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
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Lin,
 Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SGVsbG8gUGV0cmksDQoNClRoYW5rIHlvdSBzbyBtdWNoIPCfmIoNCg0KUmVnYXJkcw0KVmlkeWEN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IExhdHZhbGEsIFBldHJpIDxwZXRy
aS5sYXR2YWxhQGludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBKdW5lIDE1LCAyMDIxIDI6MjEg
UE0NClRvOiBTcmluaXZhcywgVmlkeWEgPHZpZHlhLnNyaW5pdmFzQGludGVsLmNvbT4NCkNjOiBt
YXJreWFjb3ViQGNocm9taXVtLm9yZzsgQWxtYWhhbGxhd3ksIEtoYWxlZCA8a2hhbGVkLmFsbWFo
YWxsYXd5QGludGVsLmNvbT47IExpbiwgQ2hhcmx0b24gPGNoYXJsdG9uLmxpbkBpbnRlbC5jb20+
OyBNb2RlbSwgQmhhbnVwcmFrYXNoIDxiaGFudXByYWthc2gubW9kZW1AaW50ZWwuY29tPjsgU2hh
bmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5jb20+OyBqdWhhcGVra2EuaGVpa2tpbGFAZ21h
aWwuY29tOyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IFtQQVRD
SCBpLWctdF0gdGVzdHMva21zX2JpZ19mYjogVXNlIGlndF9waXBlX2NyY19nZXRfY3VycmVudCBp
bnN0ZWFkIG9mIGlndF9waXBlX2NyY19jb2xsZWN0X2NyYw0KDQpPbiBUdWUsIEp1biAxNSwgMjAy
MSBhdCAxMToyODoyNkFNICswMzAwLCBTcmluaXZhcywgVmlkeWEgd3JvdGU6DQo+IEhlbGxvIFBl
dHJpLA0KPiANCj4gVGhlIGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMv
OTAzODkvIHJldiA3IGhhcyBiZWVuIHJldmlld2VkIGJ5IEp1aGEtUGVra2EuDQo+IFBsZWFzZSBs
ZXQgbWUga25vdyBpZiBJIG5lZWQgdG8gcmUgdXBsb2FkIHRoZSBwYXRjaCBieSBhZGRpbmcgdGhl
IFJldmlld2VkLWJ5Lg0KPiANCj4gS2luZGx5IGNvbnNpZGVyIGl0IGZvciBtZXJnZS4NCj4gDQo+
IFRoYW5rIHlvdSBzbyBtdWNoLg0KDQpNZXJnZWQsIHRoYW5rcy4NCg0KDQotLSANClBldHJpIExh
dHZhbGENCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
