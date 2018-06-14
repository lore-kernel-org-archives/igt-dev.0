Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284146E734
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jun 2018 10:32:57 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 14 Jun 2018 11:32:45 +0100
Message-Id: <20180614103252.17866-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/7] intel: aubdump changes for simulation
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

SGkgYWxsLAoKSGVyZSBhcmUgYSBmZXcgY2hhbmdlIG1vc3RseSB0YXJnZXRlZCBhdCB1c2luZyBh
dWJkdW1wIGZvciBzaW11bGF0aW9uLgoKQ2hlZXJzLAoKTGlvbmVsIExhbmR3ZXJsaW4gKDYpOgog
IGxpYjogaW50ZWw6IGFkZCBhIG5ldyBtYWNybyBmb3IgbnVtYmVyIG9mIHJlZ2lzdGVyIHRvIE1J
X0xSSQogIHRvb2xzL2F1YmR1bXA6IHJldXNlIGludGVsX3JlZy5oCiAgdG9vbHMvYXViZHVtcDog
YWRkIGxlZ2FjeSBzdWJtaXNzaW9uIG9wdGlvbgogIGxpYjogZml4IGF1YmR1bXAgZGVwZW5kZW5j
eSBpbiBhdXRvdG9vbHMgYnVpbGQKICBsaWI6IGRvbid0IGJ1aWxkIGRldmluZm8gaW5mbyBmaWxl
cyB0d2ljZQogIGxpYjogaW50ZWw6IHN0b3JlIHNpbXVsYXRvciBkZXZpY2UgaWQgZm9yIGF1YmR1
bXAKClNjb3R0IEQgUGhpbGxpcHMgKDEpOgogIHRvb2xzL2F1YmR1bXA6IGR1bXAgNDgtYml0IGFk
ZHJlc3NlcwoKIGxpYi9NYWtlZmlsZS5hbSAgICAgICAgIHwgICA5ICstCiBsaWIvTWFrZWZpbGUu
c291cmNlcyAgICB8ICAgMyAtCiBsaWIvaW50ZWxfYXViLmggICAgICAgICB8ICAgNSArLQogbGli
L2ludGVsX2NoaXBzZXQuaCAgICAgfCAgIDEgKwogbGliL2ludGVsX2RldmljZV9pbmZvLmMgfCAg
OTUgKysrKysrKystLS0KIGxpYi9pbnRlbF9yZWcuaCAgICAgICAgIHwgICAzICstCiBsaWIvbWVz
b24uYnVpbGQgICAgICAgICB8ICAyMSArKy0KIHRvb2xzL01ha2VmaWxlLmFtICAgICAgIHwgICAy
ICstCiB0b29scy9hdWJkdW1wLmMgICAgICAgICB8IDM1OSArKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiB0b29scy9pbnRlbF9hdWJkdW1wLmluICB8ICAgNyArCiAxMCBm
aWxlcyBjaGFuZ2VkLCAyNzQgaW5zZXJ0aW9ucygrKSwgMjMxIGRlbGV0aW9ucygtKQoKLS0KMi4x
Ny4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
