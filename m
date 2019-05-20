Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813B28925F
 for <igt-dev@lists.freedesktop.org>; Mon, 20 May 2019 12:16:06 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 20 May 2019 15:16:02 +0300
Message-Id: <20190520121602.18888-1-petri.latvala@intel.com>
In-Reply-To: <20190520115143.17991-1-petri.latvala@intel.com>
References: <20190520115143.17991-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX: Check all conditions to abort
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Li4uIGFuZCByZW1lbWJlciB0byBIQVggdGhlIHBpbmcgc2V0dXAgYXMgd2VsbAoKLi4uIGNvcnJl
Y3RseQotLS0KIHJ1bm5lci9leGVjdXRvci5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3J1bm5lci9leGVjdXRv
ci5jIGIvcnVubmVyL2V4ZWN1dG9yLmMKaW5kZXggYzA3ZTUzZmEuLjhjYjA5ZGRhIDEwMDY0NAot
LS0gYS9ydW5uZXIvZXhlY3V0b3IuYworKysgYi9ydW5uZXIvZXhlY3V0b3IuYwpAQCAtMzU0LDcg
KzM1NCw3IEBAIHN0YXRpYyBjaGFyICpuZWVkX3RvX2Fib3J0KGNvbnN0IHN0cnVjdCBzZXR0aW5n
cyogc2V0dGluZ3MpCiAJZm9yIChpdCA9IGFib3J0X2hhbmRsZXJzOyBpdC0+Y29uZGl0aW9uOyBp
dCsrKSB7CiAJCWNoYXIgKmFib3J0OwogCi0JCWlmICghKHNldHRpbmdzLT5hYm9ydF9tYXNrICYg
aXQtPmNvbmRpdGlvbikpCisJCWlmIChmYWxzZSAmJiAhKHNldHRpbmdzLT5hYm9ydF9tYXNrICYg
aXQtPmNvbmRpdGlvbikpCiAJCQljb250aW51ZTsKIAogCQlhYm9ydCA9IGl0LT5oYW5kbGVyKCk7
CkBAIC0xNDM1LDcgKzE0MzUsNyBAQCBib29sIGV4ZWN1dGUoc3RydWN0IGV4ZWN1dGVfc3RhdGUg
KnN0YXRlLAogCiAJaW5pdF93YXRjaGRvZ3Moc2V0dGluZ3MpOwogCi0JaWYgKHNldHRpbmdzLT5h
Ym9ydF9tYXNrICYgQUJPUlRfUElORykKKwlpZiAodHJ1ZSB8fCBzZXR0aW5ncy0+YWJvcnRfbWFz
ayAmIEFCT1JUX1BJTkcpCiAJCXBpbmdfY29uZmlnKCk7CiAKIAlpZiAoIXVuYW1lKCZ1bmFtZWJ1
ZikpIHsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
