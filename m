Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EBC6E3CA
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2019 15:46:14 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Fri,  8 Mar 2019 15:46:06 +0000
Message-Id: <20190308154609.19242-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/3] lib/syncobj: fixes & cleanups
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

SGkgYWxsLAoKSGVyZSBhcmUgYSBmZXcgY2xlYW51cHMgJiBmaXhlcyBmb3Igc3luY29iaiBoZWxw
ZXJzLgoKQ2hlZXJzLAoKTGlvbmVsIExhbmR3ZXJsaW4gKDMpOgogIGxpYi9zeW5jb2JqOiBkcm9w
IGxvY2FsIGRlY2xhcmF0aW9ucwogIGxpYi9zeW5jb2JqOiBmaXggY29tbWVudCB0eXBvCiAgbGli
L3N5bmNvYmo6IGZpeCB0aW1lb3V0IGNoZWNrCgogbGliL2lndF9zeW5jb2JqLmMgICAgIHwgMjAg
KysrKysrKy0tLS0tLS0tCiBsaWIvaWd0X3N5bmNvYmouaCAgICAgfCAyNiArLS0tLS0tLS0tLS0t
LS0tLS0tCiB0ZXN0cy9zeW5jb2JqX2Jhc2ljLmMgfCAgMiArLQogdGVzdHMvc3luY29ial93YWl0
LmMgIHwgNTggKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogNCBm
aWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkKCi0tCjIuMjAu
MQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
