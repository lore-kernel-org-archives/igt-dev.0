Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Deepak Rawat <drawat@vmware.com>
Date: Wed, 5 Sep 2018 17:03:48 -0700
Message-ID: <20180906000350.2478-4-drawat@vmware.com>
In-Reply-To: <20180906000350.2478-1-drawat@vmware.com>
References: <20180906000350.2478-1-drawat@vmware.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 3/5] tests/kms: Don't check crtc state for
 vmwgfx legacy set_crtc
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
To: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, thellstrom@vmware.com, syeh@vmware.com
Cc: Deepak Rawat <drawat@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIGEgWG9yZyBidWcgdm13Z2Z4IGhhcyBhIGtlcm5lbCB3b3JrYXJvdW5kIHdoaWNoIHJlc2V0
IHRoZSB2YWx1ZSBvZgptb2RlOjp0eXBlLiBUaGlzIHdpbGwgY2F1c2UgY3J0YyBzdGF0ZSBub3Qg
dG8gbWF0Y2ggd2hhdCBpcyBleHBlY3RlZC4KClNpZ25lZC1vZmYtYnk6IERlZXBhayBSYXdhdCA8
ZHJhd2F0QHZtd2FyZS5jb20+Ci0tLQogdGVzdHMva21zX2F0b21pYy5jIHwgNyArKysrKystCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX2F0b21pYy5jIGIvdGVzdHMva21zX2F0b21pYy5jCmluZGV4IGFjMDJiYWYw
Li43MjcxNGUxMiAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2F0b21pYy5jCisrKyBiL3Rlc3RzL2tt
c19hdG9taWMuYwpAQCAtMjM3LDcgKzIzNywxMiBAQCBzdGF0aWMgdm9pZCBjcnRjX2NvbW1pdChp
Z3RfcGlwZV90ICpwaXBlLCBpZ3RfcGxhbmVfdCAqcGxhbmUsCiB7CiAJaWd0X2Rpc3BsYXlfY29t
bWl0MihwaXBlLT5kaXNwbGF5LCBzKTsKIAotCWNydGNfY2hlY2tfY3VycmVudF9zdGF0ZShwaXBl
LCBwaXBlLT52YWx1ZXMsIHBsYW5lLT52YWx1ZXMsIHJlbGF4KTsKKwkvKgorCSAqIEZvciBhIHZt
d2dmeCB4b3JnIGRyaXZlciBidWcga2VybmVsIG1vZHVsZSByZXNldCB0aGUgdmFsdWUgb2YKKwkg
KiBtb2RlOjp0eXBlIHNvIGNydGMgc3RhdGUgY2hlY2sgZmFpbHMgZm9yIGxlZ2FjeSBjb21taXQK
KwkgKi8KKwlpZiAoIWlzX3Ztd2dmeF9kZXZpY2UocGlwZS0+ZGlzcGxheS0+ZHJtX2ZkKSB8fCAh
KHMgPT0gQ09NTUlUX0xFR0FDWSkpCisJCWNydGNfY2hlY2tfY3VycmVudF9zdGF0ZShwaXBlLCBw
aXBlLT52YWx1ZXMsIHBsYW5lLT52YWx1ZXMsIHJlbGF4KTsKIAlwbGFuZV9jaGVja19jdXJyZW50
X3N0YXRlKHBsYW5lLCBwbGFuZS0+dmFsdWVzLCByZWxheCk7CiB9CiAKLS0gCjIuMTcuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1h
aWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
