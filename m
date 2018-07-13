Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 13 Jul 2018 18:29:25 +0100
Message-Id: <20180713172925.14288-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t] igt/gem_pwrite_snooped: Check for GEM
 before use
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

QXMgd2UgdHJ5IHRvIGJsaXQgaW50byB0aGUgYnVmZmVyIHRvIGNoZWNrIENQVTwtPkdQVSBzbm9v
cGluZywgd2UgaGF2ZQp0byBjaGVjayB3ZSBoYXZlIGEgZnVuY3Rpb25hbCBHUFUgZmlyc3QuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0t
CiB0ZXN0cy9nZW1fcHdyaXRlX3Nub29wZWQuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9nZW1fcHdyaXRlX3Nub29wZWQuYyBiL3Rl
c3RzL2dlbV9wd3JpdGVfc25vb3BlZC5jCmluZGV4IGIxOTMzOTU2MC4uNDdjY2NlOGI3IDEwMDY0
NAotLS0gYS90ZXN0cy9nZW1fcHdyaXRlX3Nub29wZWQuYworKysgYi90ZXN0cy9nZW1fcHdyaXRl
X3Nub29wZWQuYwpAQCAtMTMwLDYgKzEzMCw4IEBAIGlndF9zaW1wbGVfbWFpbgogCWlndF9za2lw
X29uX3NpbXVsYXRpb24oKTsKIAogCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7
CisJaWd0X3JlcXVpcmVfZ2VtKGZkKTsKKwogCWRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChm
ZCk7CiAJYnVmbWdyID0gZHJtX2ludGVsX2J1Zm1ncl9nZW1faW5pdChmZCwgNDA5Nik7CiAKLS0g
CjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
