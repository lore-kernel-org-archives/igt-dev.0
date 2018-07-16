Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 16 Jul 2018 16:28:53 +0100
Message-Id: <20180716152854.13916-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t 1/2] igt/gem_pwrite_snooped: Check for GEM
 before use
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
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
SW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
