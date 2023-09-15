Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 15 Sep 2023 15:09:58 +0200
Message-ID: <23874386.ouqheUzb2q@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230915142849.5c620a00@maurocar-mobl2>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-32-janusz.krzysztofik@linux.intel.com>
 <20230915142849.5c620a00@maurocar-mobl2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 13/17] lib/ktap:
 Reimplement KTAP parser
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>, intel-xe@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

On Friday, 15 September 2023 14:28:49 CEST Mauro Carvalho Chehab wrote:
> On Fri,  8 Sep 2023 14:32:47 +0200
> Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> 
> Forgot to mention on my past review:
> 
> > +				       &n, &len) == 1 && len == strlen(buf))) {
> > +		/*
> > +		 * TODO: drop the following workaround as soon as
> > +		 * kernel side issue of missing lines with top level
> > +		 * KTAP version and test suite plan is fixed.
> > +		 */
> 
> Please add a link to lore with the thread discussing the issue upstream,
> as it can be helpful while this workaround is here.
> 
> Also, I would place the workaround on a separate patch, to make
> easier to revert it when upstream fixes it.

Thanks for pointing that out.  Since we already have those kernel changes 
included in v6.6-rc1, then in drm-tip, I'll drop the workaround now.

Thanks,
Janusz




