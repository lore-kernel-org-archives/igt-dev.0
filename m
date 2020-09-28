Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B77A16E0D0
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Sep 2020 17:37:24 +0000 (UTC)
Date: Mon, 28 Sep 2020 20:37:12 +0300
From: Arkadiusz Hiler <arek@hiler.eu>
Message-ID: <20200928173712.znki3ef7kcvhutg7@hatecraft.localdomain>
References: <20200928131502.41354-1-zbigniew.kempczynski@intel.com>
 <20200928152920.GV7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200928152920.GV7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_core: Reinitialize print mutex
 in child process
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBTZXAgMjgsIDIwMjAgYXQgMDY6Mjk6MjBQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBNb24sIFNlcCAyOCwgMjAyMCBhdCAwMzoxNTowMlBNICswMjAwLCBaYmlnbmll
dyBLZW1wY3p5xYRza2kgd3JvdGU6Cj4gPiBJR1QgYXJlIHByb25lIHRvIGRlYWRsb2NrIGluIGln
dF9sb2coKSBpbiBmb2xsb3dpbmcgc2NlbmFyaW86Cj4gPiAKPiA+IDEuIFBhcmVudCBwcm9jZXNz
IGNyZWF0ZXMgYWRkaXRpb25hbCB0aHJlYWQgd2hpY2ggZm9yIGV4YW1wbGUKPiA+ICAgIGlzIGRv
aW5nIGVuZGxlc3MgbG9vcAo+ID4gMi4gVGhyZWFkIHNvbWV0aW1lcyBpcyBsb2dnaW5nIHRvIGNv
bnNvbGUgdXNpbmcgaWd0X2luZm8oKS4KPiA+ICAgIFRoaXMgbG9ja3MgYW5kIHVubG9ja3MgcHJp
bnRfbXV0ZXguCj4gPiAzLiBJZiBpbiB0aGUgbWVhbnRpbWUgcGFyZW50IHByb2Nlc3Mgd2lsbCBz
cGF3biBpdCBjYW4gYmUKPiA+ICAgIHNwYXduZWQgd2l0aCBwcmludF9tdXRleCBsb2NrZWQuIElm
IGluIHRoZSBjaGlsZCBwcm9jZXNzCj4gPiAgICBpdCB3aWxsIGRvIGlndF9pbmZvKCkgaXQgd2ls
bCBkZWFkbG9jay4KPiA+IAo+ID4gV2Ugc2hvdWxkIHJlaW5pdGlhbGl6ZSBwcmludF9tdXRleCBp
biBjaGlsZCBwcm9jZXNzIHRvIGF2b2lkCj4gPiB1c2UgaW5oZXJpdGVkIHZhbHVlLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenlu
c2tpQGludGVsLmNvbT4KPiA+IENjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVs
LmNvbT4KPiA+IC0tLQo+IAo+IEFyZSB5b3UgYWJsZSB0byB0eXBlIHVwIGEgdW5pdCB0ZXN0IGlu
IGxpYi90ZXN0cy8gdGhhdCByZXByb2R1Y2VzIHRoaXMKPiBkZWFkbG9jaz8KPiAKPiBDb2RlIExH
VE0sIEFyZWssIGRvIHlvdSBzcG90IGFueXRoaW5nIGFtaXNzIHdpdGggdGhpcz8KCk90aGVyIHRo
YW4gdGhlIHJhbmRvbSB3aGl0ZXNwYWNlIGNoYW5nZXMgdGhlIHBhdGNoIGxvb2tzIGdvb2QuIFRo
YW5rcyEKCk1peGluZyB0aHJlYWRpbmcgYW5kIGZvcmtpbmcgaXMgYWx3YXlzICdmdW4nIGFuZCBw
ZW9wbGUgcmFyZWx5IHRoaW5rCmFib3V0IGl0IHVwZnJvbnQuIEkgd29uJ3QgYmUgc3VycHJpc2Vk
IGlmIHdlIHdpbGwgZmluZCBtb3JlIHRoaW5ncyBsaWtlCnRoaXMgOi0pCgotLSAKQ2hlZXJzLApB
cmVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
