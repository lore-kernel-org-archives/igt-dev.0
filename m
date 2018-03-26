Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 316DF6E353
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Mar 2018 06:27:34 +0000 (UTC)
From: Marta Lofstedt <marta.lofstedt@intel.com>
Date: Mon, 26 Mar 2018 09:29:07 +0300
Message-Id: <20180326062907.15181-1-marta.lofstedt@intel.com>
Subject: [igt-dev] [PATCH i-g-t] blacklist: Don't run DRRS test on Intel CI
 system
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
List-ID: <igt-dev@lists.freedesktop.org>

U2tpcHBpbmcgdGFrZXMgdGltZSwgc3BlY2lmaWNhbGx5IGZvciB0aGUgYmlnIGFtb3VudCBvZiBk
cnJzCnJlbGF0ZWQga21zX2Zyb250YnVmZmVyX3RyYWNraW5nIHRlc3RzLiBTaW5jZSB3ZSBjdXJy
ZW50bHkKZG9uJ3QgaGF2ZSBhbnkgc3lzdGVtIHNldCB1cCB3aXRoIERSUlMgcGFuZWxzLCBibGFj
a2xpc3RpbmcKYWxsIHRob3NlIHRlc3Qgd2lsbCBzYXZlIHRpbWUsIGFuZCB3ZSBjYW4gYXZvaWQg
dGhlIG5lZWQgdG8KaW5jcmVhc2UgdGhlIEplbmtpbnMgdGltZW91dCBpbiBvcmRlciB0byBzb2x2
ZSB0aGUgQnVnemlsbGEKYmVsb3cuCgpCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA1NjE3ClNpZ25lZC1vZmYtYnk6IE1hcnRhIExvZnN0ZWR0
IDxtYXJ0YS5sb2ZzdGVkdEBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0
LnR4dCB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEv
dGVzdHMvaW50ZWwtY2kvYmxhY2tsaXN0LnR4dCBiL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50
eHQKaW5kZXggN2NhMzEzYWMuLjBhODUwNmNhIDEwMDY0NAotLS0gYS90ZXN0cy9pbnRlbC1jaS9i
bGFja2xpc3QudHh0CisrKyBiL3Rlc3RzL2ludGVsLWNpL2JsYWNrbGlzdC50eHQKQEAgLTU3LDYg
KzU3LDcgQEAgaWd0QGdlbV90aWxlZF9zd2FwcGluZ0AoPyFub24tdGhyZWFkZWQpLioKIGlndEBn
ZW1fdXNlcnB0cl9ibGl0c0AobWFqb3J8bWlub3J8Zm9ya2VkfG1sb2NrZWR8c3dhcHBpbmcpLioK
IGlndEBnZW1fd2FpdEAuKmhhbmcuKgogaWd0QGdlbV93cml0ZV9yZWFkX3Jpbmdfc3dpdGNoKEAu
Kik/CitpZ3RAa21zX2Zyb250YnVmZmVyX3RyYWNraW5nQC4qZHJycyoKICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAjIEJyb2FkY29tCiAjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwotLSAKMi4xMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
