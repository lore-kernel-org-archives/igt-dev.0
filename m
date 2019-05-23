Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D265B89E3E
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:27:24 +0300
Message-Id: <20190523122727.6932-33-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 33/36] kms_tv_load_detect: Nuke custom main
 function
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

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0t
LQogdGVzdHMva21zX3R2X2xvYWRfZGV0ZWN0LmMgfCA2ICstLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc190
dl9sb2FkX2RldGVjdC5jIGIvdGVzdHMva21zX3R2X2xvYWRfZGV0ZWN0LmMKaW5kZXggMDEyZDA2
MjkuLjg5ZjU4N2Q1IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfdHZfbG9hZF9kZXRlY3QuYworKysg
Yi90ZXN0cy9rbXNfdHZfbG9hZF9kZXRlY3QuYwpAQCAtMjYsMTUgKzI2LDEzIEBACiAKIElHVF9U
RVNUX0RFU0NSSVBUSU9OKCJDaGVjayB0diBsb2FkIGRldGVjdGlvbiB3b3JrcyBjb3JyZWN0bHku
Iik7CiAKLWludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKK2lndF9tYWluCiB7CiAJLyog
Zm9yY2UgdGhlIFZHQSBvdXRwdXQgYW5kIHRlc3QgdGhhdCBpdCB3b3JrZWQgKi8KIAlpbnQgZHJt
X2ZkID0gMDsKIAlkcm1Nb2RlUmVzICpyZXM7CiAJZHJtTW9kZUNvbm5lY3RvciAqdHZfY29ubmVj
dG9yID0gTlVMTCwgKnRlbXA7CiAKLQlpZ3Rfc3VidGVzdF9pbml0KGFyZ2MsIGFyZ3YpOwotCiAJ
aWd0X2ZpeHR1cmUgewogCQlkcm1fZmQgPSBkcm1fb3Blbl9kcml2ZXJfbWFzdGVyKERSSVZFUl9J
TlRFTCk7CiAKQEAgLTg3LDYgKzg1LDQgQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2
KQogCQlkcm1Nb2RlRnJlZUNvbm5lY3Rvcih0dl9jb25uZWN0b3IpOwogCQljbG9zZShkcm1fZmQp
OwogCX0KLQotCWlndF9leGl0KCk7CiB9Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
