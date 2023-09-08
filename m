Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB8C10E008
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 19:17:48 +0000 (UTC)
Date: Fri, 8 Sep 2023 21:17:44 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230908211744.47d2efe6@maurocar-mobl2>
In-Reply-To: <20230908175614.bq75wyivv66sfyo6@kamilkon-desk.igk.intel.com>
References: <20230908083734.1084351-1-mauro.chehab@linux.intel.com>
 <20230908083734.1084351-11-mauro.chehab@linux.intel.com>
 <20230908175614.bq75wyivv66sfyo6@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4 10/11] scripts/doc_to_xls.py: expand
 GPU excluded platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 8 Sep 2023 19:56:14 +0200
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> > +expand_fields = {
> > +    "GPU excluded platform": "blacklist "  
> ------------------------------------------^
> Is it ok to have space there?

Yes. Basically, the string there is used as prefix as-is to the output.
So, for instance, if some test doesn't run on DG2, this will be
translated into:

	blacklist DG2

This is more flexible than appending the space inside testlist class,
as it would allow things like:

	"Foo": "foo"

will produce a XLS column:

	foobar

if the documentation has:

	Foo: bar

Regards,
Mauro
