Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9EA89BF6
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2019 11:58:31 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue, 16 Jul 2019 14:58:11 +0300
Message-Id: <20190716115814.17676-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH 0/3] Chamelium audio InfoFrame tests
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
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBhZGRzIGEgbmV3IGNoZWNrIGluIHRoZSBhdWRpbyB0ZXN0cyBmb3IgYXVkaW8gSW5mb0Zy
YW1lcy4gVGhlIHRlc3QgaXMKcHJldHR5IHNpbXBsZSBidXQgbGF5cyBkb3duIHRoZSBmb3VuZGF0
aW9ucyBmb3Igb3RoZXIgSW5mb0ZyYW1lIHRlc3RzLgoKVGhlIHNlcmllcyBpcyBtYXJrZWQgYXMg
UkZDIGJlY2F1c2UgdGhlIHNlY29uZCBwYXRjaCBkb2Vzbid0IGNoZWNrIGZvcgpDaGFtZWxpdW0g
c3VwcG9ydCBmb3IgR2V0TGFzdEluZm9GcmFtZS4gQWRkaW5nIHRoaXMgZGVwZW5kcyBvbiB0aGUg
aW4tcmV2aWV3CnBhdGNoICJsaWIvaWd0X2NoYW1lbGl1bTogYWRkIGNoYW1lbGl1bV9zdXBwb3J0
c19nZXRfdmlkZW9fcGFyYW1zIi4KClNpbW9uIFNlciAoMyk6CiAgbGliL2lndF9pbmZvZnJhbWU6
IG5ldyBsaWJyYXJ5CiAgbGliL2lndF9jaGFtZWxpdW06IGFkZCBzdXBwb3J0IGZvciBHZXRMYXN0
SW5mb0ZyYW1lCiAgdGVzdHMva21zX2NoYW1lbGl1bTogYWRkIEluZm9GcmFtZSBjaGVja3MgdG8g
YXVkaW8gdGVzdHMKCiBsaWIvTWFrZWZpbGUuc291cmNlcyAgfCAgMiArCiBsaWIvaWd0X2NoYW1l
bGl1bS5jICAgfCA1MiArKysrKysrKysrKysrKysrKysrKysrKysKIGxpYi9pZ3RfY2hhbWVsaXVt
LmggICB8IDE4ICsrKysrKysrKwogbGliL2lndF9pbmZvZnJhbWUuYyAgIHwgOTQgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogbGliL2lndF9pbmZvZnJhbWUuaCAg
IHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGxpYi9tZXNvbi5idWlsZCAgICAg
ICB8ICAxICsKIHRlc3RzL2ttc19jaGFtZWxpdW0uYyB8IDUwICsrKysrKysrKysrKysrKysrKysr
KysrCiA3IGZpbGVzIGNoYW5nZWQsIDI4MSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2
NDQgbGliL2lndF9pbmZvZnJhbWUuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9pZ3RfaW5mb2Zy
YW1lLmgKCi0tCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
