Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F3488DA5
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 05:26:57 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <0cc138314abc390aa0bfc79d5463034da3024530.1550624857.git.caz@caz-nuc.ra.intel.com>
 <20190219222110.19815-1-chris@chris-wilson.co.uk>
Date: Tue, 19 Feb 2019 21:26:56 -0800
In-Reply-To: <20190219222110.19815-1-chris@chris-wilson.co.uk> (Chris Wilson's
 message of "Tue, 19 Feb 2019 15:21:10 -0700")
Message-ID: <87sgwjav33.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Incrementally mlock()
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBGZWIgMTkgMjAxOSBhdCAwMzoyMToxMCBQTSwgQ2hyaXMgV2lsc29uIDxjaHJpc0Bj
aHJpcy13aWxzb24uY28udWs+IHdyb3RlOgo+IEFzIHdlIGFscmVhZHkgaGF2ZSB0aGUgcHJldmlv
dXMgcG9ydGlvbiBvZiB0aGUgbW1hcCBtbG9ja2VkLCB3ZSBvbmx5Cj4gbmVlZCB0byBtbG9jaygp
IHRoZSBmcmVzaCBwb3J0aW9uIGZvciB0ZXN0aW5nIGF2YWlsYWJsZSBtZW1vcnkuCgpTdGlsbCBs
b29raW5nIGF0IHdoYXQgaXMgd3Jvbmcgd2l0aCB0aGUgcGF0Y2ggYnV0IHdpdGggdGhlIHBhdGNo
IHRoZQp0ZXN0IGlzIHVuYWJsZSB0byBsb2NrIGFzIG11Y2ggbWVtb3J5IGFzIGJlZm9yZSBhbmQg
aW52b2tlIHRoZQpzaHJpbmtlci4gSGVyZSBhcmUgdGhlIG91dHB1dHMgYmVmb3JlIGFuZCBhZnRl
ciB0aGUgcGF0Y2ggb24gYSBzeXN0ZW0Kd2l0aCAxNiBHQjoKCi0tLS0tLS0tQkVGT1JFLS0tLS0t
LS0tCgojIC4vaTkxNV9zdXNwZW5kIC0tcnVuLXN1YnRlc3Qgc2hyaW5rCklHVC1WZXJzaW9uOiAx
LjIzLWc3ODAyMzI0ZSAoeDg2XzY0KSAoTGludXg6IDUuMC4wLXJjNSsgeDg2XzY0KQpTdGFydGlu
ZyBzdWJ0ZXN0OiBzaHJpbmsKY2hpbGQgMCBkaWVkIHdpdGggc2lnbmFsIDksIEtpbGxlZApjaGls
ZCAwIGRpZWQgd2l0aCBzaWduYWwgOSwgS2lsbGVkCmNoaWxkIDAgZGllZCB3aXRoIHNpZ25hbCA5
LCBLaWxsZWQKY2hpbGQgMCBkaWVkIHdpdGggc2lnbmFsIDksIEtpbGxlZApjaGlsZCAwIGRpZWQg
d2l0aCBzaWduYWwgOSwgS2lsbGVkCmNoaWxkIDAgZGllZCB3aXRoIHNpZ25hbCA5LCBLaWxsZWQK
Y2hpbGQgMCBkaWVkIHdpdGggc2lnbmFsIDksIEtpbGxlZApjaGlsZCAwIGRpZWQgd2l0aCBzaWdu
YWwgOSwgS2lsbGVkCmNoaWxkIDAgZGllZCB3aXRoIHNpZ25hbCA5LCBLaWxsZWQKY2hpbGQgMCBk
aWVkIHdpdGggc2lnbmFsIDksIEtpbGxlZApMb2NrZWQgMTYsMTY1LDEwOSw3NjAgQiAoMTUsNDE2
IE1pQikKW2NtZF0gcnRjd2FrZTogd2FrZXVwIGZyb20gIm1lbSIgdXNpbmcgL2Rldi9ydGMwIGF0
IFdlZCBOb3YgMjUgMDY6MDI6NTUgMTk5OApTdWJ0ZXN0IHNocmluazogU1VDQ0VTUyAoMzUuOTE3
cykKCi0tLS0tLS0tQUZURVItLS0tLS0tLS0KCiMgLi9pOTE1X3N1c3BlbmQgLS1ydW4tc3VidGVz
dCBzaHJpbmsKSUdULVZlcnNpb246IDEuMjMtZ2RhZDY4NDg0ICh4ODZfNjQpIChMaW51eDogNS4w
LjAtcmM1KyB4ODZfNjQpClN0YXJ0aW5nIHN1YnRlc3Q6IHNocmluawpMb2NrZWQgMTIsMTU3LDk3
Niw1NzYgQiAoMTEsNTk0IE1pQikKW2NtZF0gcnRjd2FrZTogd2FrZXVwIGZyb20gIm1lbSIgdXNp
bmcgL2Rldi9ydGMwIGF0IFdlZCBOb3YgMjUgMDY6MDQ6MDIgMTk5OApTdWJ0ZXN0IHNocmluazog
U1VDQ0VTUyAoMTAuMjQ3cykKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
