Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Sat, 7 Jul 2018 20:24:27 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <cover.1531004191.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [igt-dev] [PATCH i-g-t 0/2] Add support to force specific module
 load
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
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, gustavo@padovan.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBhZGRzIHN1cHBvcnQgZm9yIGZvcmNpbmcgYSBzcGVjaWZpYyBtb2R1bGUg
dG8gYmUgbG9hZGVkCnZpYSBjb21tYW5kIGxpbmUuIFRoaXMgZmVhdHVyZSBjYW4gYnJpbmcgYmVu
ZWZpdHMgZm9yIGRldmVsb3BlcnMgdGhhdApuZWVkIHRvIGNyZWF0ZSBhIG5ldyBtb2R1bGUgc2lu
Y2UgdGhleSBjYW4gdXNlIElHVCBhcyBhIGJhc2UgdGVzdCB0bwpndWlkZSB0aGVpciBkZXZlbG9w
bWVudCAoVGVzdC1kcml2ZW4gZGV2ZWxvcG1lbnQgLSBUREQgKS4gVGhlIGZpcnN0CnBhdGNoLCBl
eHBhbmQgdGhlIHNpemUgb2YgdGhlIG1vZHVsZSBuYW1lIGFjY2VwdGVkIGJ5IElHVCB0byBtYWtl
CnBvc3NpYmxlIHRoYXQgbW9kdWxlcyB3aXRoIGxhcmdlciBuYW1lcyBjYW4gYmUgbG9hZGVkLiBU
aGUgc2Vjb25kIHBhdGNoCmhhcyB0aGUgZm9yY2Ugb3B0aW9uIGltcGxlbWVudGF0aW9uLgoKVGhl
IGRpc2N1c3Npb24gYWJvdXQgdGhpcyBmZWF0dXJlIHN0YXJ0ZWQgd2l0aCBhbiBSRkMgbmFtZWQg
IltQQVRDSAppLWctdF0gW1JGQ10gQWRkIHN1cHBvcnQgdG8gZm9yY2Ugc3BlY2lmaWMgbW9kdWxl
IGxvYWQiLCBsaW5rOgpodHRwczovL3d3dy5zcGluaWNzLm5ldC9saXN0cy9pbnRlbC1nZngvbXNn
MTY2NzY0Lmh0bWwKClJvZHJpZ28gU2lxdWVpcmEgKDIpOgogIEluY3JlYXNlIHRoZSBzdHJpbmcg
c2l6ZSBmb3IgYSBtb2R1bGUgbmFtZQogIEFkZCBzdXBwb3J0IGZvciBmb3JjaW5nIHNwZWNpZmlj
IG1vZHVsZQoKIGxpYi9kcm10ZXN0LmMgICAgICAgIHwgMzkgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tCiBsaWIvaWd0X2NvcmUuYyAgICAgICB8IDIzICsrKysrKysrKysr
KysrKysrKysrKysrCiBsaWIvaWd0X2NvcmUuaCAgICAgICB8ICA0ICsrKysKIHNjcmlwdHMvcnVu
LXRlc3RzLnNoIHwgIDQgKysrLQogNCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQoKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
