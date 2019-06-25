Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959E3898AF
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2019 13:14:27 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue, 25 Jun 2019 16:14:21 +0300
Message-Id: <20190625131431.29336-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 00/10] Chamelium port mapping
 auto-discovery
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
To: igt-dev@lists.freedesktop.org
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Q2hhbmdlcyBmcm9tIHYzIHRvIHY0IChBcmVrKToKLSBNYWtlIGNoYW1lbGl1bV9lZGlkX2dldF9y
YXcgcmV0dXJuIG1lbW9yeSB0aGF0IHdvbid0IGJlIG11dGF0ZWQKLSBSZW1vdmUgYXV0b2Rpc2Nv
dmVyX3BvcnRzIGhhcmRjb2RlZCBJRHMsIHVzZSBHZXRTdXBwb3J0ZWRJbnB1dHMgYW5kCiAgSGFz
VmlkZW9TdXBwb3J0IGluc3RlYWQKLSBBZGQgY2hhbWVsaXVtX2F1dG9kaXNjb3ZlciBkZXNjcmlw
dGlvbgotIFRyaWVkIHRvIGltcHJvdmUgcmVhZGFiaWxpdHkgb2YgY2hhbWVsaXVtX2F1dG9kaXNj
b3ZlcgotIEZpeCB0eXBvCgpTaW1vbiBTZXIgKDEwKToKICBsaWIvaWd0X2VkaWQ6IGFkZCBlZGlk
X2dldF9zaXplCiAgbGliL2lndF9jaGFtZWxpdW06IGZpeCBjaGFtZWxpdW1fcG9ydF9zZXRfZWRp
ZCBkb2NzCiAgbGliL2lndF9jaGFtZWxpdW06IGFsbG93IEVESURzIHRvIGJlIG11dGF0ZWQgZm9y
IGVhY2ggcG9ydAogIGxpYi9pZ3RfY2hhbWVsaXVtOiBzcGxpdCBjaGFtZWxpdW1fbmV3X2VkaWQK
ICBsaWIvaWd0X2NoYW1lbGl1bTogYWRkIENIQU1FTElVTV9NQVhfUE9SVFMKICBsaWIvaWd0X2No
YW1lbGl1bTogdXBsb2FkIG9uZSBFRElEIHBlciBwb3J0CiAgbGliL2lndF9jaGFtZWxpdW06IHNl
dCBFRElEIHNlcmlhbAogIGxpYi9pZ3RfZWRpZDogYWRkIGVkaWRfZ2V0X21mZwogIGxpYi9pZ3Rf
Y2hhbWVsaXVtOiBhZGQgY2hhbWVsaXVtX2dldF92aWRlb19wb3J0cwogIGxpYi9pZ3RfY2hhbWVs
aXVtOiBhdXRvZGlzY292ZXIgQ2hhbWVsaXVtIHBvcnQgbWFwcGluZ3MKCiBsaWIvaWd0X2NoYW1l
bGl1bS5jICAgfCAzODcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
CiBsaWIvaWd0X2NoYW1lbGl1bS5oICAgfCAgIDkgKwogbGliL2lndF9lZGlkLmMgICAgICAgIHwg
IDIzICsrKwogbGliL2lndF9lZGlkLmggICAgICAgIHwgICAyICsKIHRlc3RzL2ttc19jaGFtZWxp
dW0uYyB8ICAxNyArLQogNSBmaWxlcyBjaGFuZ2VkLCA0MDEgaW5zZXJ0aW9ucygrKSwgMzcgZGVs
ZXRpb25zKC0pCgotLQoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
