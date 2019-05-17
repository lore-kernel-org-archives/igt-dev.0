Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Fri, 17 May 2019 12:25:03 +0100
Message-Id: <20190517112526.6738-3-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20190517112526.6738-1-tvrtko.ursulin@linux.intel.com>
References: <20190517112526.6738-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 02/25] trace.pl: Ignore signaling on non
 i915 fences
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCmdlbV93c2lt
IHVzZXMgdGhlIHN3X2ZlbmNlIHRpbWVsaW5lIGFuZCBjb25mdXNlcyB0aGUgc2NyaXB0LgoKU2ln
bmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KLS0t
CiBzY3JpcHRzL3RyYWNlLnBsIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9zY3JpcHRzL3RyYWNlLnBsIGIvc2NyaXB0cy90cmFjZS5wbAppbmRleCBi
N2JiYWJjNzlmNjguLjkzMGU1MDJhZDhlYiAxMDA3NTUKLS0tIGEvc2NyaXB0cy90cmFjZS5wbAor
KysgYi9zY3JpcHRzL3RyYWNlLnBsCkBAIC00MzksNiArNDM5LDcgQEAgd2hpbGUgKDw+KSB7CiAJ
fSBlbHNpZiAoJHRwX25hbWUgZXEgJ2RtYV9mZW5jZTpkbWFfZmVuY2Vfc2lnbmFsZWQ6Jykgewog
CQlteSAkZ2tleTsKIAorCQluZXh0IHVubGVzcyAkdHB7J2RyaXZlcid9IGVxICdpOTE1JzsKIAkJ
ZGllIHVubGVzcyBleGlzdHMgJGN0eGVuZ2luZXN7JHRweydjb250ZXh0J319OwogCiAJCSRna2V5
ID0gZGJfa2V5KCRjdHhlbmdpbmVzeyR0cHsnY29udGV4dCd9fSwgJHRweydjb250ZXh0J30sICR0
cHsnc2Vxbm8nfSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWdmeA==
