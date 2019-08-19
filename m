Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4D776E445
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2019 22:34:25 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Mon, 19 Aug 2019 15:31:37 -0700
Message-Id: <20190819223137.3605-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/igt_command_line.sh: Add new selftest
 for special handling
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

ZG1hYnVmX3NlbGZ0ZXN0cyBoYXMgYmVlbiByZWNlbnRseSBhZGRlZCB0byB0aGUgdGVzdCBsaXN0
IGJ1dCBub3QgYWRkZWQKdG8gdGhlIHNwZWNpYWwgaGFuZGxpbmcgaW4gaWd0X2NvbW1hbmRfbGlu
ZS5zaCBhbmQgdGhlcmVmb3JlIGJ1aWxkCnRlc3Rpbmcgd291bGQgZmFpbC4KClNpZ25lZC1vZmYt
Ynk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVsLmNvbT4KQ2M6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2lndF9j
b21tYW5kX2xpbmUuc2ggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pZ3RfY29tbWFuZF9saW5lLnNoIGIvdGVz
dHMvaWd0X2NvbW1hbmRfbGluZS5zaAppbmRleCA5MjY0M2M0ZC4uZWFlYzFiNGYgMTAwNzU1Ci0t
LSBhL3Rlc3RzL2lndF9jb21tYW5kX2xpbmUuc2gKKysrIGIvdGVzdHMvaWd0X2NvbW1hbmRfbGlu
ZS5zaApAQCAtOTAsNyArOTAsNyBAQCBjaGVja190ZXN0ICgpCiAJCSMgU3VidGVzdCBlbnVtZXJh
dGlvbiBvZiBrZXJuZWwgc2VsZnRlc3QgbGF1bmNoZXJzIGRlcGVuZHMKIAkJIyBvbiB0aGUgcnVu
bmluZyBrZXJuZWwuIElmIHNlbGZ0ZXN0cyBhcmUgbm90IGVuYWJsZWQsCiAJCSMgdGhleSB3aWxs
IG91dHB1dCBub3RoaW5nIGFuZCBleGl0IHdpdGggMC4KLQkJaWYgWyAiJHRlc3RuYW1lIiAhPSAi
aTkxNV9zZWxmdGVzdCIgLWEgIiR0ZXN0bmFtZSIgIT0gImRybV9tbSIgLWEgIiR0ZXN0bmFtZSIg
IT0gImttc19zZWxmdGVzdCIgXTsgdGhlbgorCQlpZiBbICIkdGVzdG5hbWUiICE9ICJpOTE1X3Nl
bGZ0ZXN0IiAtYSAiJHRlc3RuYW1lIiAhPSAiZHJtX21tIiAtYSAiJHRlc3RuYW1lIiAhPSAia21z
X3NlbGZ0ZXN0IiAtYSAiJHRlc3RuYW1lIiAhPSAiZG1hYnVmX3NlbGZ0ZXN0cyJdOyB0aGVuCiAJ
CQlmYWlsICR0ZXN0CiAJCWZpCiAJZmkKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
