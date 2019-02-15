Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CBC6E058
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Feb 2019 00:40:44 +0000 (UTC)
Date: Thu, 14 Feb 2019 16:40:41 -0800
Message-Id: <20190215004043.21500-1-stuart.summers@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/2] Enhance debug capability in
 kms_chamelium
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
From: Stuart Summers via igt-dev <igt-dev@lists.freedesktop.org>
Reply-To: Stuart Summers <stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXMgY2xlYW5zIHVwIHRoZSBtaXNzZWQgcmVxdWly
ZW1lbnQgZm9yIFZHQQp0ZXN0cyBpbiBDSSBkdWUgdG8gbGFjayBvZiBzdXBwb3J0IGluIGxhdGVy
IGhhcmR3YXJlLgoKVGhlIHNlY29uZCBwYXRjaCBhZGRzIGEgbmV3IGxpYnNzaCBpbnRlcmZhY2Ug
dG8gZXh0cmFjdCBjaGFtZWxlb25kCmRhZW1vbiBsb2dzIGZyb20gdGhlIENoYW1lbGlvbiBib2Fy
ZC4gT3ZlciB0aW1lLCBpdCBtaWdodCBiZSBpbnRlcmVzdGluZwp0byBhZGQgbmV3IHJlbW90ZSBs
b2dnaW5nIGNhcGFiaWxpdHkgaW50byB0aGUgUHl0aG9uIGRhZW1vbiBpdHNlbGYgb3IgdG8KbW92
ZSB0aGlzIHNzaCBiYXNlZCBsb2cgY2FwdHVyZSBpbnRvIHRoZSBleGlzdGluZyB4bWxycGMgaW50
ZXJmYWNlLiBGb3IKdGhlIHNob3J0IHRlcm0sIEkgYW0gaG9waW5nIHRvIGV4dHJhY3Qgc29tZSBh
ZGRpdGlvbmFsIGxvZ3MgZnJvbSBDSSB3aXRoCnRoaXMgcGF0Y2guCgpTdHVhcnQgU3VtbWVycyAo
Mik6CiAgaTkxNS9rbXNfY2hhbWVsaXVtOiBSZXF1aXJlIGdlbiA8IDkgZm9yIFZHQSB0ZXN0aW5n
CiAgaTkxNS9rbXNfY2hhbWVsaXVtOiBQdWxsIGNoYW1lbGVvbmQgbG9ncyBmb3IgZGVidWdnaW5n
CgogRG9ja2VyZmlsZS5kZWJpYW4gICAgIHwgICAxICsKIERvY2tlcmZpbGUuZmVkb3JhICAgICB8
ICAgMSArCiBsaWIvaWd0X2NoYW1lbGl1bS5jICAgfCAxNTAgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKystCiBsaWIvbWVzb24uYnVpbGQgICAgICAgfCAgIDQgKysKIG1l
c29uLmJ1aWxkICAgICAgICAgICB8ICAgNCArLQogdGVzdHMva21zX2NoYW1lbGl1bS5jIHwgICAy
ICsKIDYgZmlsZXMgY2hhbmdlZCwgMTYwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
