Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518E96EEC6
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jul 2018 20:55:06 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Thu, 19 Jul 2018 13:54:43 -0700
Message-Id: <20180719205445.3040-1-lucas.demarchi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 0/2] Fix i-g-t on old systems
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

SUdUIG5vdyByZXF1aXJlcyBtZW1mZF9jcmVhdGUoKSB3aGljaCBpcyBub3QgYXZhaWxhYmxlIG9u
IG9sZCB2ZXJzaW9ucwpvZiBnbGliYyAob3Igc29tZSBhbHRlcm5hdGl2ZSBsaWJjcykuICBUaGlz
IHByb3ZpZGVzIGEgbWluaW1hbCBpbnRydXNpdmUKd2F5IHRvIGtlZXAgYnVpbGRpbmcgb24gdGhv
c2Ugb2xkIHN5c3RlbXMgd2l0aG91dCBwb2xsdXRpbmcgdGhlIGNvZGUKd2l0aCBhIGNvbXBhdGli
aWxpdHkgbGF5ZXIuCgpUaGUgYXBwcm9hY2ggaXMgc2ltaWxhciB0byB3aGF0IEkndmUgYmVlbiB1
c2luZyBpbiBvdGhlciBwcm9qZWN0cyBsaWtlCnN5c3RlbWQsIGttb2QsIGFyZHVwaWxvdCwgZXRj
LiBUaGUgc3lzY2FsbCBudW1iZXJzIGNhbWUgZnJvbSBzeXN0ZW1kLgoKTHVjYXMgRGUgTWFyY2hp
ICgyKToKICBidWlsZDogcHJvdmlkZSBpbmNsdWRlIGZvciBtaXNzaW5nIHN5c2NhbGxzCiAgc3R1
YnM6IHByb3ZpZGUgaW1wbGVtZW50YXRpb24gZm9yIG1lbWZkX2NyZWF0ZQoKIGxpYi9zdHVicy9z
eXNjYWxsL1JFQURNRSAgICAgfCAgNiArKysrKysKIGxpYi9zdHVicy9zeXNjYWxsL3N5cy9tbWFu
LmggfCAzNyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIG1lc29uLmJ1aWxk
ICAgICAgICAgICAgICAgICAgfCAgNSArKysrLQogMyBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3N0dWJzL3N5c2Nh
bGwvUkVBRE1FCiBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3N0dWJzL3N5c2NhbGwvc3lzL21tYW4u
aAoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
