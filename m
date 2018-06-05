Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296506EE8E
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jun 2018 16:25:41 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Tue,  5 Jun 2018 17:25:34 +0100
Message-Id: <20180605162536.26848-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] tests/perf: tests for holding
 preemption on filtered ctx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SGksCgpIZXJlIGlzIGEgdGVzdHMgZm9yIGEgbmV3IGk5MTUvcGVyZiBmZWF0dXJlIHRoYXQgYWxs
b3dzIHVzIHRvIGhvbGQKcHJlZW1wdGlvbiBvbiB0aGUgY29udGV4dCB3ZSB3YW50IHRvIG1vbml0
b3IgdXNpbmcgaTkxNS9wZXJmLgoKWW91IGNhbiBmaW5kIHRoZSBzZXJpZXMgYXQgOgoKaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy80NDI5MS8KCkNoZWVycywKCkxpb25l
bCBMYW5kd2VybGluICgyKToKICBidW1wIGhlYWRlcnMgZm9yIGRpc2FibGUgcHJlZW1wdGlvbgog
IHRlc3RzL3BlcmY6IGFkZCB0ZXN0IGZvciBkaXNhYmxlZCBwcmVlbXB0aW9uIHN0cmVhbQoKIGlu
Y2x1ZGUvZHJtLXVhcGkvaTkxNV9kcm0uaCB8ICAgOCArCiBsaWIvaW50ZWxfcmVnLmggICAgICAg
ICAgICAgfCAgIDEgKwogdGVzdHMvcGVyZi5jICAgICAgICAgICAgICAgIHwgNTEwICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA1MTkgaW5zZXJ0
aW9ucygrKQoKLS0KMi4xNy4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
