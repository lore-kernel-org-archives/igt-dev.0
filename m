Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8AAE6E50A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2018 18:50:34 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Mon, 26 Feb 2018 10:50:30 -0800
Message-Id: <20180226185030.16862-3-lucas.demarchi@intel.com>
In-Reply-To: <20180226185030.16862-1-lucas.demarchi@intel.com>
References: <20180226185030.16862-1-lucas.demarchi@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] run-tests.sh: allow relative
 IGT_TEST_ROOT and IGT_CONFIG_PATH
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
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

V2hlbiBwaWdsaXQgcnVucyBpdCBjaGRpcigpIHRvIGl0cyBvd24gZGlyZWN0b3J5LCBzbyBwYXNz
aW5nIGEgcmVsYXRpdmUKcGF0aCBkb2Vzbid0IHdvcmsuIEUuZy46CgoJRmF0YWwgRXJyb3I6IElH
VCBkaXJlY3RvcnkgZG9lcyBub3QgZXhpc3QuIE1pc3Npbmc6IGJ1aWxkL3Rlc3RzCgpNYWtlIHN1
cmUgcGF0aCBpcyBhYnNvbHV0ZSB0aHJvdWdob3V0IHRoZSBzY3JpcHQuCgpTaWduZWQtb2ZmLWJ5
OiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4KLS0tCiBzY3JpcHRz
L3J1bi10ZXN0cy5zaCB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9zY3JpcHRzL3J1bi10ZXN0cy5zaCBiL3Njcmlw
dHMvcnVuLXRlc3RzLnNoCmluZGV4IDkyYzU1NzhjLi4yOGYyOWRhNCAxMDA3NTUKLS0tIGEvc2Ny
aXB0cy9ydW4tdGVzdHMuc2gKKysrIGIvc2NyaXB0cy9ydW4tdGVzdHMuc2gKQEAgLTI0LDggKzI0
LDggQEAKIAogUk9PVD0iYGRpcm5hbWUgJDBgIgogUk9PVD0iYHJlYWRsaW5rIC1mICRST09ULy4u
YCIKLUlHVF9URVNUX1JPT1Q9IiR7SUdUX1RFU1RfUk9PVDotJFJPT1QvdGVzdHN9IgotSUdUX0NP
TkZJR19QQVRIPSIke0lHVF9DT05GSUdfUEFUSDotJEhPTUUvLmlndHJjfSIKK0lHVF9URVNUX1JP
T1Q9ImByZWFkbGluayAtZiAke0lHVF9URVNUX1JPT1Q6LSRST09UL3Rlc3RzfWAiCitJR1RfQ09O
RklHX1BBVEg9ImByZWFkbGluayAtZiAke0lHVF9DT05GSUdfUEFUSDotJEhPTUUvLmlndHJjfWAi
CiBSRVNVTFRTPSIkUk9PVC9yZXN1bHRzIgogUElHTElUPWB3aGljaCBwaWdsaXQgMj4gL2Rldi9u
dWxsYAogCi0tIAoyLjE0LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
