Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri,  1 Nov 2019 14:21:23 +0000
Message-Id: <20191101142123.18136-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_selftests: Expose 'perf' selftests
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RmluZCBhbGwgdGhlIHBlcmYqIHNlbGZ0ZXN0cyBhbmQgZXhwb3NlIHRoZW0gaW4gb3VyIGlndC4g
SW4gQ0kgd2UgZXhwZWN0CnRoZXNlIG5vdCB0byBiZSBydW4gaW4gQkFUIChzaW5jZSB0aGV5IGFy
ZSBqdXN0IHBlcmZvcm1hbmNlIHRlc3RzIHJhdGhlcgp0aGFuIGNvbmZvcm1hbmNlKSwgYnV0IGV4
cGVjdCB0aGUgcmVzdWx0cyB0byBiZSBhdmFpbGFibGUgZnJvbSB0aGUKc2hhcmRzLgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBNYXR0
aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+CkNjOiBUb21pIFNhcnZlbGEgPHRvbWku
cC5zYXJ2ZWxhQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2k5MTVfc2VsZnRlc3QuYyB8IDUg
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0
cy9pOTE1L2k5MTVfc2VsZnRlc3QuYyBiL3Rlc3RzL2k5MTUvaTkxNV9zZWxmdGVzdC5jCmluZGV4
IDZkNTk3ZTY4Mi4uYWJjOGM5Yzc5IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2k5MTVfc2VsZnRl
c3QuYworKysgYi90ZXN0cy9pOTE1L2k5MTVfc2VsZnRlc3QuYwpAQCAtNDAsNCArNDAsOSBAQCBp
Z3RfbWFpbgogCQkJICAgICJsaXZlX3NlbGZ0ZXN0cz0tMSBkaXNhYmxlX2Rpc3BsYXk9MSBzdF9m
aWx0ZXI9JXMiLAogCQkJICAgIGVudikgPCBzaXplb2Yob3B0cykpOwogCWlndF9rc2VsZnRlc3Rz
KCJpOTE1Iiwgb3B0cywgImxpdmVfc2VsZnRlc3RzIiwgImxpdmUiKTsKKworCWlndF9hc3NlcnQo
c25wcmludGYob3B0cywgc2l6ZW9mKG9wdHMpLAorCQkJICAgICJwZXJmX3NlbGZ0ZXN0cz0tMSBk
aXNhYmxlX2Rpc3BsYXk9MSBzdF9maWx0ZXI9JXMiLAorCQkJICAgIGVudikgPCBzaXplb2Yob3B0
cykpOworCWlndF9rc2VsZnRlc3RzKCJpOTE1Iiwgb3B0cywgInBlcmZfc2VsZnRlc3RzIiwgInBl
cmYiKTsKIH0KLS0gCjIuMjQuMC5yYzIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
