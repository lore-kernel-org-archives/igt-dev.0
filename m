Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E64689E1D
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Mar 2018 23:07:52 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Fri, 16 Mar 2018 16:07:46 -0700
Message-Id: <20180316230746.30641-2-dhinakaran.pandiyan@intel.com>
In-Reply-To: <20180316230746.30641-1-dhinakaran.pandiyan@intel.com>
References: <20180316230746.30641-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] HACK: Frontbuffer tests to fastfeedback
 list
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VG8gdGVzdCBQU1Igb24gQkFUIG1hY2hpbmVzLgoKQ2M6IE1hcnRhIExvZnN0ZWR0IDxtYXJ0YS5s
b2ZzdGVkdEBpbnRlbC5jb20+CkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBEaGluYWthcmFuIFBhbmRpeWFuIDxk
aGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZl
ZWRiYWNrLnRlc3RsaXN0IHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCBi
L3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKaW5kZXggNWJhZDhjNzkuLmIy
YmJlMWZlIDEwMDY0NAotLS0gYS90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0
CisrKyBiL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QKQEAgLTIyNCw2ICsy
MjQsMTMgQEAgaWd0QGttc19mb3JjZV9jb25uZWN0b3JfYmFzaWNAZm9yY2UtZWRpZAogaWd0QGtt
c19mb3JjZV9jb25uZWN0b3JfYmFzaWNAZm9yY2UtbG9hZC1kZXRlY3QKIGlndEBrbXNfZm9yY2Vf
Y29ubmVjdG9yX2Jhc2ljQHBydW5lLXN0YWxlLW1vZGVzCiBpZ3RAa21zX2Zyb250YnVmZmVyX3Ry
YWNraW5nQGJhc2ljCitpZ3RAa21zX2Zyb250YnVmZmVyX3RyYWNraW5nQHBzci0ycC1wcmltc2Ny
bi1zcHItaW5kZmItbW92ZQoraWd0QGttc19mcm9udGJ1ZmZlcl90cmFja2luZ0BmYmNwc3ItMnAt
c2NuZHNjcm4taW5kZmItcGdmbGlwLWJsdAoraWd0QGttc19mcm9udGJ1ZmZlcl90cmFja2luZ0Bw
c3ItcmdiNTY1LWRyYXctYmx0CitpZ3RAa21zX2Zyb250YnVmZmVyX3RyYWNraW5nQHBzci0ycC1w
cmltc2Nybi1zcHItaW5kZmItZHJhdy1yZW5kZXIKK2lndEBrbXNfZnJvbnRidWZmZXJfdHJhY2tp
bmdAcHNyLTJwLXNjbmRzY3JuLXByaS1zaHJmYi1kcmF3LXB3cml0ZQoraWd0QGttc19mcm9udGJ1
ZmZlcl90cmFja2luZ0Bwc3ItMnAtc2NuZHNjcm4tcHJpLWluZGZiLWRyYXctbW1hcC1jcHUKK2ln
dEBrbXNfZnJvbnRidWZmZXJfdHJhY2tpbmdAcHNyLXNsb3dkcmF3CiBpZ3RAa21zX3BpcGVfY3Jj
X2Jhc2ljQGJhZC1zb3VyY2UKIGlndEBrbXNfcGlwZV9jcmNfYmFzaWNAaGFuZy1yZWFkLWNyYy1w
aXBlLWEKIGlndEBrbXNfcGlwZV9jcmNfYmFzaWNAaGFuZy1yZWFkLWNyYy1waXBlLWIKLS0gCjIu
MTQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
