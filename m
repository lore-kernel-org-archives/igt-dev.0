Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed,  5 Sep 2018 14:49:28 +0100
Message-Id: <20180905134939.2942-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20180905134939.2942-1-tvrtko.ursulin@linux.intel.com>
References: <20180905134939.2942-1-tvrtko.ursulin@linux.intel.com>
Subject: [Intel-gfx] [PATH i-g-t 02/13] trace.pl: Use undocumented -o to
 perf record to allow tee
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
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClNpZ25lZC1v
ZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogc2Ny
aXB0cy90cmFjZS5wbCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvc2NyaXB0cy90cmFjZS5wbCBiL3NjcmlwdHMvdHJh
Y2UucGwKaW5kZXggMjk3NmNmZGY1ODVhLi4xOGY5ZjNiMTgzOTYgMTAwNzU1Ci0tLSBhL3Njcmlw
dHMvdHJhY2UucGwKKysrIGIvc2NyaXB0cy90cmFjZS5wbApAQCAtMTcwLDggKzE3MCw5IEBAIHN1
YiBhcmdfdHJhY2UKIAlpZiAoJF9bMF0gZXEgJy0tdHJhY2UnKSB7CiAJCXNoaWZ0IEBfOwogCisJ
CXVuc2hpZnQgQF8sICctLSc7CiAJCXVuc2hpZnQgQF8sIGpvaW4oJywnLCBAZXZlbnRzKTsKLQkJ
dW5zaGlmdCBAXywgKCdwZXJmJywgJ3JlY29yZCcsICctYScsICctYycsICcxJywgJy1xJywgJy1l
Jyk7CisJCXVuc2hpZnQgQF8sICgncGVyZicsICdyZWNvcmQnLCAnLWEnLCAnLWMnLCAnMScsICct
cScsICctbycsICdwZXJmLmRhdGEnLCAnLWUnKTsKIAogCQlleGVjIEBfOwogCX0KLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwt
Z2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
