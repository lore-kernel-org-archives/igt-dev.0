Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri,  7 Aug 2020 11:19:50 +0200
Message-Id: <20200807092002.32350-5-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200807092002.32350-1-janusz.krzysztofik@linux.intel.com>
References: <20200807092002.32350-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 04/16] tests/core_hotunplug: Assert
 successful device filter application
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
Cc: intel-gfx@lists.freedesktop.org, =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UmV0dXJuIHZhbHVlIG9mIGlndF9kZXZpY2VfZmlsdGVyX2FkZCgpIHJlcHJlc2VudGluZyBhIG51
bWJlciBvZgpzdWNjZXNzZnVsbHkgaW5zdGFsbGVkIGRldmljZSBmaWx0ZXJzIGlzIG5vdyBpZ25v
cmVkLiAgRmFpbCBpZiBub3QgMS4KCnYyOiBSZWJhc2Ugb24gY3VycmVudCB1cHN0cmVhbSBtYXN0
ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKYW51c3ogS3J6eXN6dG9maWsgPGphbnVzei5rcnp5c3p0b2Zp
a0BsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBNaWNoYcWCIFdpbmlhcnNraSA8bWljaGFs
LndpbmlhcnNraUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvY29yZV9ob3R1bnBsdWcuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMgYi90ZXN0cy9jb3JlX2hvdHVucGx1Zy5jCmluZGV4
IDU1N2Y5ZTNmYS4uNmNlYjMyNWFkIDEwMDY0NAotLS0gYS90ZXN0cy9jb3JlX2hvdHVucGx1Zy5j
CisrKyBiL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMKQEAgLTE3OCw3ICsxNzgsNyBAQCBzdGF0aWMg
dm9pZCBzZXRfZmlsdGVyX2Zyb21fZGV2aWNlKGludCBmZCkKIAlpZ3RfYXNzZXJ0KHJlYWxwYXRo
KHBhdGgsIGRzdCkpOwogCiAJaWd0X2RldmljZV9maWx0ZXJfZnJlZV9hbGwoKTsKLQlpZ3RfZGV2
aWNlX2ZpbHRlcl9hZGQoZmlsdGVyKTsKKwlpZ3RfYXNzZXJ0X2VxKGlndF9kZXZpY2VfZmlsdGVy
X2FkZChmaWx0ZXIpLCAxKTsKIH0KIAogLyogU3VidGVzdHMgKi8KLS0gCjIuMjEuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
