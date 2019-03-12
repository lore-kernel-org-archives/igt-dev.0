Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530C16E02F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 21:58:04 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Tue, 12 Mar 2019 14:57:34 -0700
Message-Id: <20190312215738.5598-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 0/4] Improve mmap interface coverage
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

QWRkaW5nIHNvbWUgbmVnYXRpdmUgaW50ZXJmYWNlIHRlc3RzIHRvIHRoZSBtbWFwIElPQ1RMLiBU
aGUgdGVzdHMgaW50cm9kdWNlZApoZXJlIHN1cHBseSBzb21lIGludmFsaWQgcGFyYW1ldGVycyB0
byB0aGUgTU1BUCBJT0NUTCBhbmQgZXhwZWN0IGFuIGVycm9yCmluIHJldHVybi4KClRoZSBzZXJp
ZXMgYWxzbyBhZGRzIGEgbmV3IHRlc3QgZm9yIHByaW1lIG1tYXAgY29ycmVjdG5lc3MuIFRoZSBp
ZGVhIHdhcyB0byBhZGQKdGVzdHMgZm9yIGFsbCBjb2hlcmVuY3kgY29ycmVjdG5lc3MgY2hlY2tz
IGJ1dCB0aGUgdGVzdHMgYnV0IGFsbCB0aG9zZSBJIGxvb2tlZAphdCBoYWQgYSBXQyBzdWJ0ZXN0
LiBTaW5jZSBJIHByb2JhYmx5IG1pc3NlZCBzb21ldGhpbmcgc2VuZGluZyB0aGlzIGFzIFJGQyA6
KS4KCkFudG9uaW8gQXJnZW56aWFubyAoNCk6CiAgdGVzdHMvaTkxNS9nZW1fbW1hcF9ndHQ6IEFk
ZCBpbnZhbGlkIHBhcmFtZXRlcnMgdGVzdAogIHRlc3RzL2k5MTUvZ2VtX21tYXA6IEFkZCBpbnZh
bGlkIHBhcmFtZXRlcnMgdGVzdHMKICB0ZXN0cy9pOTE1L2dlbV9tbWFwX3djOiBBZGQgaW52YWxp
ZCBwYXJhbXMgdGVzdHMKICB0ZXN0cy9pOTE1L3ByaW1lX21tYXA6IEFkZCBXQyBjb3JyZWN0bmVz
cyB0ZXN0CgogdGVzdHMvaTkxNS9nZW1fbW1hcC5jICAgICB8IDE4ICsrKysrKysrKysrKysrCiB0
ZXN0cy9pOTE1L2dlbV9tbWFwX2d0dC5jIHwgMTIgKysrKysrKysrCiB0ZXN0cy9pOTE1L2dlbV9t
bWFwX3djLmMgIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0
ZXN0cy9wcmltZV9tbWFwLmMgICAgICAgIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKy0t
CiA0IGZpbGVzIGNoYW5nZWQsIDExNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
