Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BBC6E93C
 for <igt-dev@lists.freedesktop.org>; Fri, 25 May 2018 15:26:43 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri, 25 May 2018 16:26:38 +0100
Message-Id: <20180525152640.2356-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t v6 0/2] intel: per context powergating tests
 & benchmark
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

SGksCgpVcGRhdGluZyBmb2xsb3dpbmcgQ2hyaXMnIHJlcXVlc3QgdG8gZHJvcCB0aGUgZHJtX2lu
dGVsIEFQSXMuIEFsc28KZHJvcHBpbmcgYSBzaWxseSB0ZXN0IHRoYXQgS2VsdmluIHBvaW50ZWQg
b3V0LgoKVGhhbmtzIGFsbCBmb3IgeW91ciByZXZpZXdzLAoKTGlvbmVsIExhbmR3ZXJsaW4gKDIp
OgogIGhlYWRlcnM6IGJ1bXAKICB0ZXN0czogYWRkIHNsaWNlIHBvd2VyIHByb2dyYW1taW5nIHRl
c3QKCiBpbmNsdWRlL2RybS11YXBpL2FtZGdwdV9kcm0uaCAgfCAgMjMgKwogaW5jbHVkZS9kcm0t
dWFwaS9kcm0uaCAgICAgICAgIHwgICA3ICsKIGluY2x1ZGUvZHJtLXVhcGkvZHJtX21vZGUuaCAg
ICB8ICAyMiArLQogaW5jbHVkZS9kcm0tdWFwaS9ldG5hdml2X2RybS5oIHwgICA2ICsKIGluY2x1
ZGUvZHJtLXVhcGkvZXh5bm9zX2RybS5oICB8IDI0MCArKysrKysrKysKIGluY2x1ZGUvZHJtLXVh
cGkvaTkxNV9kcm0uaCAgICB8ICA0MyArKwogaW5jbHVkZS9kcm0tdWFwaS9tc21fZHJtLmggICAg
IHwgICAyICsKIGluY2x1ZGUvZHJtLXVhcGkvdGVncmFfZHJtLmggICB8IDQ5MiArKysrKysrKysr
KysrKysrKy0KIGluY2x1ZGUvZHJtLXVhcGkvdmM0X2RybS5oICAgICB8ICAxMyArLQogaW5jbHVk
ZS9kcm0tdWFwaS92aXJ0Z3B1X2RybS5oIHwgICAxICsKIHRlc3RzL01ha2VmaWxlLnNvdXJjZXMg
ICAgICAgICB8ICAgMSArCiB0ZXN0cy9nZW1fY3R4X3BhcmFtLmMgICAgICAgICAgfCAgIDQgKy0K
IHRlc3RzL2dlbV9jdHhfc3NldS5jICAgICAgICAgICB8IDg4MSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIHRlc3RzL21lc29uLmJ1aWxkICAgICAgICAgICAgICB8ICAgMSArCiAx
NCBmaWxlcyBjaGFuZ2VkLCAxNzE5IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2dlbV9jdHhfc3NldS5jCgotLQoyLjE3LjAKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
