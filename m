Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AE8B10E6D4
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 17:41:41 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Date: Fri, 25 Aug 2023 17:41:34 +0000
Message-ID: <6cc0f9cf9f0ff5dbaa1acdd107e50b6a84f4fc26.camel@intel.com>
References: <20230815173659.1208384-1-alan.previn.teres.alexis@intel.com>
 <20230816142739.k2ycx6vn5rrx33rt@kamilkon-desk1>
 <97e776c356d5a7b7bc7a78423e4f0502c97810e4.camel@intel.com>
In-Reply-To: <97e776c356d5a7b7bc7a78423e4f0502c97810e4.camel@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF85175C15FB7A419160C25D7D3EFFF8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Add a helper lib to read mmio
 registers via ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCAyMDIzLTA4LTI1IGF0IDEwOjI1IC0wNzAwLCBUZXJlcyBBbGV4aXMsIEFsYW4gUHJl
dmluIHdyb3RlOg0KPiA+ID4gLQlkb19pb2N0bChkcm1fZmQsIERSTV9JT0NUTF9JOTE1X1JFR19S
RUFELCAmcnIpOw0KPiA+ID4gKwlpOTE1X3JlZ19yZWFkX2lvY3RsKGRybV9mZCwgMHgyMzU4LCAm
dmFsKTsNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSBeXl5eXl4NCj4g
PiBNYXliZSBkZWZpbmUgaXQgYXQgaTkxNV9tbWlvX3JlZy5oID8NCj4gPiANCj4gPiAjZGVmaW5l
IE1NSU9fUkVHX1JFTkRFUl9SSU5HX1RJTUVTVEFNUCAweDIzNTgNCj4gPiANCj4gYWxhbjogeWVz
IC0gbXkgYmFkIC0gaSBzaG91bGQgaGF2ZSBkb25lIHRoYXQgdXAgZnJvbnQuDQpKdXN0IHJlYWxp
emVkIHRoaXMgdGhpbmcgaXMgdXNlZC9kZWZpbmVkIGluIGEgZmV3IHBsYWNlcyAoYmVsb3cgaXMg
dGhlIGdyZXApDQpidXQgaSBndWVzcyB0aGUgcmlnaHQgcGxhY2Ugd291bGQgYmUgbGliL2ludGVs
X3JlZy5oIHdpdGggYWxsIHRoZSBvdGhlcnM/DQpJIGFsc28gZmVlbCB3ZSBkb250IG5lZWQgdGhl
ICJNTUlPX1JFRyIgaW4gZnJvbnQgKGxpa2Ugb3RoZXJzIGluIGludGVsX3JlZy5oKS4NCkknbGwg
cmUtcmV2IGFuZCB3ZSBjYW4gdGFrZSBhIDJuZCBsb29rLiBUaGFua3MgaW4gYWR2YW5jZS4NCg0K
ICAgdGVzdHMvaTkxNS9pOTE1X3BtX3JwbS5jOjE4NjI6CWk5MTVfcmVnX3JlYWRfaW9jdGwoZHJt
X2ZkLCAweDIzNTgsICZ2YWwpOw0KICAgdGVzdHMvaTkxNS9nZW1fcmVnX3JlYWQuYzo1NzojZGVm
aW5lIFJFTkRFUl9SSU5HX1RJTUVTVEFNUCAweDIzNTgNCiAgIHRlc3RzL2k5MTUvZ2VtX2N0eF9p
c29sYXRpb24uYzoyMzA6CXsgIlJDUyB0aW1lc3RhbXAiLCBHRU42LCB+MHUsIDB4MjM1OCB9LA0K
ICAgDQogICB0ZXN0cy94ZS94ZV9tbWlvLmM6MjM6I2RlZmluZSBSQ1NfVElNRVNUQU1QIDB4MjM1
OA0KICAgDQogICBsaWIvaW50ZWxfcmVnLmg6NDYyOiNkZWZpbmUgVElNRVNUQU1QX1FXICAgICAg
ICAgICAweDIzNTgNCiAgIHRvb2xzL2ludGVsX2ZvcmNld2FrZWQuYzo2MjoJcmV0dXJuIChpbnRl
bF9yZWdpc3Rlcl9yZWFkKG1taW9fZGF0YSwgMHgyMzU4KSAhPSAwKTsNCiAgIHRvb2xzL2k5MTUt
cGVyZi9pOTE1X3BlcmZfcmVjb3JkZXIuYzo2MjY6I2RlZmluZSBSRU5ERVJfUklOR19USU1FU1RB
TVAgMHgyMzU4DQogICANCg==
