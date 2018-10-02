Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
In-Reply-To: <b01d74fe-763a-0b65-b0b9-49ca091077b6@intel.com>
References: <20180928102002.10541-1-chris@chris-wilson.co.uk>
 <c67237b6-a3e5-4d11-a483-aa7ecd800ff4@intel.com>
 <153842301482.23109.9425007086680751049@skylake-alporthouse-com>
 <b01d74fe-763a-0b65-b0b9-49ca091077b6@intel.com>
Message-ID: <153846900061.7415.2196966772772919022@jlahtine-desk.ger.corp.intel.com>
Date: Tue, 02 Oct 2018 11:30:00 +0300
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 1/5] igt/kms_getfb: Check
 the iface exists before use
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMTAtMDEgMjI6NTM6NDYpCj4gRmFpciBl
bm91Z2guCj4gCj4gQWNrZWQtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnpp
YW5vQGludGVsLmNvbT4KPiAKPiBmb3IgdGhlIHNlcmllcy4KClBsZWFzZSwgcmVhZCB0aGUgZm9s
bG93aW5nIGNoYXB0ZXJzICh0aGV5J3JlIGFwcGxpY2FibGUgZm9yIHRoZSBwYXRjaAp0YWcgbWVh
bmluZ3MgaW4gSUdULCB0b28pOgoKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4x
OC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3doZW4tdG8tdXNlLWFja2VkLWJ5LWNj
LWFuZC1jby1kZXZlbG9wZWQtYnkKaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NC4x
OC9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5odG1sI3VzaW5nLXJlcG9ydGVkLWJ5LXRlc3Rl
ZC1ieS1yZXZpZXdlZC1ieS1zdWdnZXN0ZWQtYnktYW5kLWZpeGVzCgpJZiB3ZSBzcGVuZCB0aGUg
dGltZSB0byBhY3R1YWxseSByZXZpZXcgdGhlIHBhdGNoZXMsIHRoYXQgc2hvdWxkIGJlCmRvY3Vt
ZW50ZWQgd2l0aCBhIHByb3BlciBSZXZpZXdlZC1ieSBhbmQgbm90IGEgdmFndWUgQWNrZWQtYnku
CgpSZWdhcmRzLCBKb29uYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KSW50ZWwtZ2Z4IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50
ZWwtZ2Z4Cg==
