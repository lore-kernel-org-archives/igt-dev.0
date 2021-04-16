Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA6C6ECA4
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Apr 2021 17:48:49 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Apr 2021 20:48:39 +0300
Message-Id: <20210416174841.20132-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
References: <20210416174841.20132-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] lib: Fix option parsing
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCi0t
c2tpcC1jcmMtY29tcGFyZSBhbmQgLS10cmFjZS1vbi1vb3BzIG1pc3Rha2VubHkgYWJvcnQgZnVy
dGhlcgpvcHRpb24gcGFyc2luZy4gU28gZGVwZW5kaW5nIG9uIHdoZXJlIHlvdSBoYXZlIHRoZW0g
aW4geW91ciBjb21tYW5kIGxpbmUKeW91IGdldCBzb21lIHZlcnkgY29uZnVzaW5nIGJlaGF2aW91
ciB3aGVyZSBzb21lIG9mIHRoZSBvcHRpb25zIGdldAp0b3RhbGx5IGlnbm9yZWQuCgpTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgot
LS0KIGxpYi9pZ3RfY29yZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfY29yZS5jIGIvbGliL2ln
dF9jb3JlLmMKaW5kZXggNmE0M2Q5NTVkNTYyLi5lYzA1NTM1Y2Q1NmUgMTAwNjQ0Ci0tLSBhL2xp
Yi9pZ3RfY29yZS5jCisrKyBiL2xpYi9pZ3RfY29yZS5jCkBAIC0xMDE0LDEwICsxMDE0LDEwIEBA
IHN0YXRpYyBpbnQgY29tbW9uX2luaXQoaW50ICphcmdjLCBjaGFyICoqYXJndiwKIAkJCWdvdG8g
b3V0OwogCQljYXNlIE9QVF9TS0lQX0NSQzoKIAkJCWlndF9za2lwX2NyY19jb21wYXJlID0gdHJ1
ZTsKLQkJCWdvdG8gb3V0OworCQkJYnJlYWs7CiAJCWNhc2UgT1BUX1RSQUNFX09PUFM6CiAJCQlz
aG93X2Z0cmFjZSA9IHRydWU7Ci0JCQlnb3RvIG91dDsKKwkJCWJyZWFrOwogCQljYXNlIE9QVF9E
RVZJQ0U6CiAJCQlhc3NlcnQob3B0YXJnKTsKIAkJCS8qIGlmIHNldCBieSBlbnYgSUdUX0RFVklD
RSB3ZSBuZWVkIHRvIGZyZWUgaXQgKi8KLS0gCjIuMjYuMwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
