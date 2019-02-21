Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4688489022
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 21:42:20 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Thu, 21 Feb 2019 06:41:02 -0800
Message-Id: <20190221144109.28220-1-dhinakaran.pandiyan@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/7] Use rendercopy for generating CCS
 buffers
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2VyaWVzIGluY2x1ZGVzIHJlYmFzZWQgdmVyc2lvbiBvZiBwYXRjaGVzIGZyb20gVmlsbGUncyBz
ZXJpZXMgLQpodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzUxNzcwLwpN
b2RpZmllciB0ZXN0aW5nIGZvciBrbXNfcGxhbmUgaGFzIGJlZW4gZGVsaWJlcmF0ZWx5IGxlZnQg
b3V0IGZyb20gdGhlCmFib3ZlIHNlcmllcyBhcyB0aGUgY29tYmluYXRpb24gWWYtQ0NTLUJHUjg4
OCBmYWlscyBvbiBJQ0wgYW5kIG5lZWRzCmRlYnVnLgoKRGhpbmFrYXJhbiBQYW5kaXlhbiAoMyk6
CiAgbGliL2lndF9mYjogRnVuY3Rpb24gdG8gY3JlYXRlIGEgYm8gZm9yIHBhc3NlZCBpbiBpZ3Rf
ZmIKICB0ZXN0cy9rbXNfY2NzOiBHZW5lcmF0ZSBjb21wcmVzc2VkIHN1cmZhY2VzIHdpdGggcmVu
ZGVyY29weQogIHRlc3RzL2ttc19jY3M6IExhcmdlciBmYiB0byBmdWxseSBjb3ZlciB1cCB0aGUg
cHJpbWFyeSBwbGFuZQoKVmlsbGUgU3lyasOkbMOkICg0KToKICBsaWIvcmVuZGVyY29weTogQWRk
IHN1cHBvcnQgZm9yIFlmL1lzIHRpbGluZyB0byBnZW45IHJlbmRlcmNvcHkKICB0ZXN0cy9nZW1f
cmVuZGVyX2NvcHk6IFRlc3QgWWYgdGlsaW5nCiAgbGliL2lndF9mYjogVXNlIHJlbmRlcmNvcHkg
Zm9yIHJlbmRlcmluZyBpbnRvIGNvbXByZXNzZWQgYnVmZmVycwogIGxpYi9pZ3RfZmI6IHMvdGls
aW5nL21vZGlmaWVyLyB3aGVyZSBhcHByb3ByaWF0ZQoKIGxpYi9nZW44X3JlbmRlci5oICAgICAg
ICAgICAgfCAgIDYgKy0KIGxpYi9pZ3RfZmIuYyAgICAgICAgICAgICAgICAgfCAyMzkgKysrKysr
KysrKysrKysrKysrKysrKysrKystLS0tLS0tLQogbGliL2lndF9mYi5oICAgICAgICAgICAgICAg
ICB8ICAyNSArKy0tCiBsaWIvcmVuZGVyY29weV9nZW45LmMgICAgICAgIHwgICA4ICstCiB0ZXN0
cy9pOTE1L2dlbV9yZW5kZXJfY29weS5jIHwgMjQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tCiB0ZXN0cy9rbXNfY2NzLmMgICAgICAgICAgICAgIHwgMjE4ICsrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIDYgZmlsZXMgY2hhbmdlZCwgNDU4IGluc2VydGlvbnMoKyks
IDI4NCBkZWxldGlvbnMoLSkKCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
